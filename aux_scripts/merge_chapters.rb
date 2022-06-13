#! /usr/bin/env ruby

# frozen_string_literal: true

require 'fileutils'
require 'optparse'

command = ARGV.shift

case command
when '-s'
  folder_name = ARGV.shift
  Dir.mkdir(folder_name) unless File.exist?(folder_name)

  ARGV.sort.each do |chapter|
    Dir.glob("#{chapter}/*").sort.each_with_index do |file, i|
      extension = File.extname(file)
      file_name = format("#{folder_name}/#{chapter}-%02d#{extension}", i)
      FileUtils.cp(file, file_name)
    end
  end
when '-a'
  folder_name = ARGV.shift
  Dir.mkdir(folder_name) unless File.exist?(folder_name)

  ARGV.sort.each do |volume|
    volume_folder = "#{folder_name}/#{volume}"
    FileUtils.mkdir_p(volume_folder)
    Dir.glob("#{volume}/**").sort.each do |chapter|
      Dir.glob("#{chapter}/*").each_with_index do |file, i|
        extension = File.extname(file)
        file_name = format("#{folder_name}/#{chapter}-%02d#{extension}", i)
        FileUtils.cp(file, file_name)
      end
    end

    cbz_name = "#{volume_folder}.cbz"
    system("zip -r \"#{cbz_name}\" \"#{volume_folder}\"")
    puts "#{cbz_name} produced!"
    FileUtils.remove_dir(volume_folder)
  end
when '-z'
  ARGV.sort.each do |volume|
    cbz_name = "#{volume}.cbz"
    system("zip -r \"#{cbz_name}\" \"#{volume}\"")
    puts "#{cbz_name} produced!"
  end
else
  puts 'No command was passed.'
end
