#!/usr/bin/env ruby

# file: pxlite.rb


require 'rxfreader'
require 'polyrex-builder'


class PxLite

  attr_accessor :records, :summary

  def initialize(location=nil, schema: nil)

    @schema = schema
    @summary, @records  = {}, []

    return @schema = location if location[/\[/]
    s, _ = RXFReader.read location

    if s then
      parse xml=s
    end

  end

  def to_xml()

    rootname = @schema[/\w+/]
    parents =  @schema.scan(/\w+(?=\[)/).map(&:to_sym)

    pb = PolyrexBuilder.new(@records, parents: parents,
                            summary: summary, rootname: rootname)
    pb.to_xml

  end

  private

  def parse(xml)

    @summary, @records = scan(Rexle.new(xml).root)
    @schema = @summary[:schema]

  end

  def scan(node)

    summary = node.xpath('summary/*').map {|x| [x.name.to_sym, x.text]}.to_h
    records = node.xpath('records/*').map {|x| scan x}

    if records.any? then
      [summary, records]
    else
      [summary]
    end

  end

end
