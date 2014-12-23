directory "Build"

desc "Build the Donna module"
task :donna => "Build/libDonna.a"

file "Build/libDonna.a" => FileList["Build", "Source/*.swift"] do |t|
  sources = Dir["Source/*.swift"].join(" ")
  module_name = t.name.pathmap("%{lib,}n")
  sh "xcrun -sdk macosx swiftc " \
     "-emit-library -o #{t.name} " \
     "-emit-module -emit-module-path Build/#{module_name}.swiftmodule " \
     "-module-name #{module_name} " \
     "#{sources}"
end

desc "Build the main program"
file "main" => ["main.swift", "Build/libDonna.a"] do |t|
  sh "xcrun -sdk macosx swiftc -o 'Swift Donna' -IBuild -LBuild -lDonna #{t.name}.swift"
end

file "Build/Swift Donna Tests" => FileList["Build/libDonna.a", "Tests/*.swift"] do |t|
  sources = Dir["Tests/*.swift"].join(" ")
  sh "xcrun -sdk macosx swiftc " \
     "-o '#{t.name}' " \
     "-F/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks " \
     "-Xlinker -rpath -Xlinker /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks " \
     "-IBuild -LBuild -lDonna " \
     "#{sources}"
end

desc "Build and run the tests"
task :test => "Build/Swift Donna Tests" do |t|
  sh "xcrun xctest 'Build/Swift Donna Tests'"
end

desc "Clean build products"
task :clean do
  rm_rf "Build"
end

task :default => "main"
