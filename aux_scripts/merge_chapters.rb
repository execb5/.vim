#! /usr/bin/env ruby

# frozen_string_literal: true

require 'fileutils'
require 'optparse'

folder_name = ARGV.shift

Dir.mkdir(folder_name) unless File.exist?(folder_name)

ARGV.sort.each do |chapter|
  Dir.glob("#{chapter}/*").sort.each_with_index do |file, i|
    extension = File.extname(file)
    file_name = format("#{folder_name}/#{chapter}-%02d#{extension}", i)
    FileUtils.cp(file, file_name)
  end
end
