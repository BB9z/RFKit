#! /usr/bin/env sh

set -eo pipefail
# set -euxo pipefail

echo $TRAVIS_COMMIT
echo $TRAVIS_COMMIT_MESSAGE
echo $TRAVIS_BRANCH
echo "RFCI_TASK = $RFCI_TASK"

if [ "$RFCI_TASK" = "POD_LINT" ]; then
    pod lib lint --allow-warnings
elif [ "$RFCI_TASK" = "Xcode9" ]; then
    echo "Test for macOS and watchOS."
    XC_TestMac
    XC_TestWatch

    echo "Test on lastest device and OS."
    XC_Test "Test-iOS"   "platform=iOS Simulator,name=iPhone X,OS=11.3"
    XC_Test "Test-tvOS"  "platform=tvOS Simulator,name=Apple TV 4K,OS=11.3"

    echo "Test on old device and OS".
    XC_Test "Test-iOS"   "platform=iOS Simulator,name=iPhone 5,OS=9.0"
    XC_Test "Test-tvOS"  "platform=tvOS Simulator,name=Apple TV,OS=9.0"

    echo "Test Swift"
    XC_Test "Test-Swift" "platform=iOS Simulator,name=iPhone X,OS=11.3"

elif [ "$RFCI_TASK" = "Xcode8" ]; then
    echo "Test for macOS and watchOS."
    XC_TestMac
    XC_TestWatch
    
    XC_Test "Test-iOS"   "platform=iOS Simulator,name=iPhone 6,OS=10.2"
    XC_Test "Test-tvOS"  "platform=tvOS Simulator,name=Apple TV 1080p,OS=10.2"
fi

# Run test
# $1 scheme
# $2 destination
XC_Test() {
    xcodebuild test -enableCodeCoverage YES -workspace Test/RFKit.xcworkspace -scheme "$1" -destination "$2" ONLY_ACTIVE_ARCH=NO GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES | xcpretty
}

# Run macOS test
XC_TestMac() {
    xcodebuild test -enableCodeCoverage YES -workspace Test/RFKit.xcworkspace -scheme "Test-macOS" GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES | xcpretty
}

# Run watchOS test
XC_TestWatch() {
    xcodebuild build -workspace Test/RFKit.xcworkspace -scheme Target-watchOS ONLY_ACTIVE_ARCH=NO | xcpretty
}
