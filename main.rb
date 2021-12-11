# frozen_string_literal: true

require 'optparse'
require File.expand_path('lib/quaker3')

options = {}

OptionParser.new do |parser|
  parser.on('-f', '--file FILE',
            'Require the FILE path to extract data') do |file|
    options[:file] = file
  end
end.parse!

quaker3 = Quaker3::Parser.new options[:file]
quaker3.games.each do |game|
  p '==========================='
  p game.to_h
  p '---------------------------'
  p game.to_h_grouped
  p '---------------------------'
  p game.to_h_grouped_by_mode
  p '==========================='
end
