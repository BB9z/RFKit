#! /usr/bin/env sh

set -eo pipefail
# set -euxo pipefail

echo $TRAVIS_COMMIT_MESSAGE
echo "RFCI_TASK = $RFCI_TASK"
readonly RFWorkspace="Test/RFKit.xcworkspace"
readonly RFSTAGE="$1"
echo "RFSTAGE = $RFSTAGE"

# Run test
# $1 scheme
# $2 destination
XC_Test() {
    xcodebuild test -enableCodeCoverage YES -workspace "$RFWorkspace" -scheme "$1" -destination "$2" ONLY_ACTIVE_ARCH=NO GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES | xcpretty
}

# Run macOS test
XC_TestMac() {
    xcodebuild test -enableCodeCoverage YES -workspace "$RFWorkspace" -scheme "Test-macOS" GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES | xcpretty
}

# Run watchOS build
XC_TestWatch() {
    xcodebuild build -workspace "$RFWorkspace" -scheme Target-watchOS ONLY_ACTIVE_ARCH=NO | xcpretty
}

STAGE_MAIN() {
    if [ "$RFCI_TASK" = "POD_LINT" ]; then
        if [[ "$TRAVIS_COMMIT_MESSAGE" = *"[skip lint]"* ]]; then
            echo "Skip pod lint"
        else
            echo "TRAVIS_BRANCH = $TRAVIS_BRANCH"
            gem install cocoapods --no-rdoc --no-ri --no-document --quiet
            if [ "$TRAVIS_BRANCH" = "develop" ]; then
                pod lib lint --allow-warnings
            else
                pod lib lint
            fi
        fi

    elif [ "$RFCI_TASK" = "Xcode10" ]; then
        pod install --project-directory=Test

        echo "Test for macOS and watchOS."
        XC_TestMac
        XC_TestWatch

        echo "Test on lastest device and OS."
        XC_Test "Test-iOS"   "platform=iOS Simulator,name=iPhone X,OS=12.0"
        XC_Test "Test-tvOS"  "platform=tvOS Simulator,name=Apple TV 4K,OS=12.0"

        echo "Test on old device and OS".
        XC_Test "Test-iOS"   "platform=iOS Simulator,name=iPhone 5,OS=9.0"
        XC_Test "Test-tvOS"  "platform=tvOS Simulator,name=Apple TV,OS=9.0"

        echo "Test Swift"
        XC_Test "Test-Swift" "platform=iOS Simulator,name=iPhone X,OS=11.3"

    elif [ "$RFCI_TASK" = "Xcode9" ]; then
        pod install --project-directory=Test

        echo "Test for macOS and watchOS."
        XC_TestMac
        XC_TestWatch

        XC_Test "Test-iOS"   "platform=iOS Simulator,name=iPhone X,OS=11.4"
        XC_Test "Test-tvOS"  "platform=tvOS Simulator,name=Apple TV 4K,OS=11.4"

        echo "Test Swift"
        XC_Test "Test-Swift" "platform=iOS Simulator,name=iPhone X,OS=11.4"

    elif [ "$RFCI_TASK" = "Xcode8" ]; then
        pod install --project-directory=Test

        echo "Test for macOS and watchOS."
        XC_TestMac
        XC_TestWatch
        
        XC_Test "Test-iOS"   "platform=iOS Simulator,name=iPhone 6,OS=10.2"
        XC_Test "Test-tvOS"  "platform=tvOS Simulator,name=Apple TV 1080p,OS=10.2"
    fi
}

STAGE_SUCCESS() {
    if [ "$RFCI_TASK" = "Xcode10" ]; then
        curl -s https://codecov.io/bash | bash -s
    fi
}

STAGE_FAILURE() {
    if [[ "$RFCI_TASK" == Xcode* ]]; then
        cat -n ~/Library/Logs/DiagnosticReports/xctest*.crash
    fi
}

"STAGE_$RFSTAGE"
