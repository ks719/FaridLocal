require 'find'
require 'FileUtils'
features = []
plugins = []
File.foreach("testfile.txt") do |line|
  pluginJar = /(?<=\bplugins\/).*\.jar/ .match(line)
  plugins << pluginJar.to_s if pluginJar
  featureJar = /(?<=\bfeatures\/).*\.jar/ .match(line)
  features << featureJar.to_s if featureJar
end
puts plugins,features

pluginPath = ""
featurePath = ""
destPath = "C:\\Users\\ks719\\Documents\\AptanaStudio3Workspace\\RubyStudy\\dest"
Find.find(pluginPath) do |path|
  puts path
  puts File.basename(path)
  if FileTest.directory?(path)
  else
    if plugins.include?(File.basename(path).to_s)
      puts "findout:" + path
      FileUtils.cp(path, destPath)
    end  
  end
end
