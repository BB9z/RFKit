
target 'RFKit iOS' do
    platform :ios, '10.0'

    pod 'RFKit', :path => '.', :subspecs => ['Default',
        'Category/NSDate',
        'Category/NSDateFormatter',
        'Category/NSFileManager',
        'Category/NSJSONSerialization',
        'Category/NSNumberFormatter',
        'Category/NSURL',
        'Category/NSLayoutConstraint'
    ]
end

target 'RFKit macOS' do
    platform :osx, '10.12'

    pod 'RFKit', :path => '.', :subspecs => ['Default',
        'Category/NSDate',
        'Category/NSDateFormatter',
        'Category/NSFileManager',
        'Category/NSJSONSerialization',
        'Category/NSNumberFormatter',
        'Category/NSURL'
    ]
end

target 'Test-iOS' do
    platform :ios, '8.0'

    pod 'RFKit', :path => '.', :subspecs => ['ALL']
end

target 'Test-macOS' do
    platform :osx, '10.10'
    
    pod 'RFKit', :path => '.', :subspecs => ['ALL']
end

target 'Test-tvOS' do
    platform :tvos, '9.0'
    
    pod 'RFKit', :path => '.', :subspecs => ['ALL']
end

target 'Target-watchOS' do
    platform :watchos, '2.0'
    
    pod 'RFKit', :path => '.', :subspecs => ['ALL']
end

target 'Test-Swift' do
    platform :ios, '12.0'

    pod 'RFKit', :path => '.', :subspecs => ['ALL']
end
