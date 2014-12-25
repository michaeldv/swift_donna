
SOURCE = "SwiftDonna"
TESTS = "#{SOURCE}Tests"
BUILD = "Build"
FRAMEWORKS = `xcode-select --print-path`.chop + "/Platforms/MacOSX.platform/Developer/Library/Frameworks"
EXECUTABLE = "Swift Donna"
TEST_EXECUTABLE = EXECUTABLE + " Tests"

directory BUILD

file "#{BUILD}/libDonna.a" => FileList[BUILD, "#{SOURCE}/*.swift"] do |t|
  sources = Dir["#{SOURCE}/*.swift"].join(" ")
  library = t.name.pathmap("%{lib,}n")
  sh "xcrun -sdk macosx swiftc " \
     "-emit-library -o #{t.name} " \
     "-emit-module -emit-module-path #{BUILD}/#{library}.swiftmodule " \
     "-module-name #{library} " \
     "#{sources}"
end

desc "Build #{EXECUTABLE} executable"
file "main" => ["main.swift", "#{BUILD}/libDonna.a"] do |t|
  sh "xcrun -sdk macosx swiftc -o '#{EXECUTABLE}' -I#{BUILD} -L#{BUILD} -lDonna #{t.name}.swift"
end

file "#{BUILD}/#{TEST_EXECUTABLE}" => FileList["#{BUILD}/libDonna.a", "#{TESTS}/*.swift"] do |t|
  sources = Dir["#{TESTS}/*.swift"].join(" ")
  sh "xcrun -sdk macosx swiftc " \
     "-o '#{t.name}' " \
     "-F #{FRAMEWORKS} " \
     "-Xlinker -rpath -Xlinker #{FRAMEWORKS} " \
     "-I#{BUILD} -L#{BUILD} -lDonna -lswiftStdlibUnittest " \
     "#{sources}"
end

desc "Build #{EXECUTABLE} library module"
task :lib => "#{BUILD}/libDonna.a"

desc "Build and run #{TEST_EXECUTABLE}"
task :test => "#{BUILD}/#{TEST_EXECUTABLE}" do |t|
  sh "xcrun xctest '#{BUILD}/#{TEST_EXECUTABLE}'" do |ok, status|
    puts ok ? "PASS" : "FAIL"
  end
end

desc "Clean up build artifacts"
task :clean do
  rm_rf BUILD
end

task :default => "main"
