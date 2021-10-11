# Copyright (c) 2020-2021 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'glimmer-dsl-tk'

class HelloLabel
  include Glimmer
  
  def launch
    root {
      title 'Hello, Label!'
      
      notebook {
        frame(text: 'left-aligned') {
          1.upto(3) do |n|
            label {
              text "Field #{n}"
              width 60
              anchor 'w'
            }
          end
        }
        
        frame(text: 'centered') {
          1.upto(3) do |n|
            label {
              text "Field #{n}"
              width 60
              anchor 'center'
            }
          end
        }
        
        frame(text: 'right-aligned') {
          1.upto(3) do |n|
            label {
              text "Field #{n}"
              width 60
              anchor 'e'
            }
          end
        }
        
        frame(text: 'justified') {
          label {
            text <<~MULTI_LINE_STRING
              This is a very long paragraph that spans multiple lines. It looks better and
              is easier to read when justified. In fact, this is how to make it look like a
              new paper column. That results in professional looking text. Magazines use the
              same sort of justified text. Word processors also support justified text. In
              fact, this is how text is made for news papers and magainzes, and then published
              in paper form and digitally.
            MULTI_LINE_STRING
            width 60
            anchor 'center'
            justify 'center' # other options are: 'left' and 'right'
            font 'caption' # other options are: 'default', 'text', 'fixed', 'menu', 'heading', 'small_caption', 'icon', 'tooltip'
            foreground 'blue'
          }
        }
        
        frame(text: 'images') {
          ['denmark', 'finland', 'norway'].each do |image_name|
            label {
              image File.expand_path("images/#{image_name}.png", __dir__)
            }
          end
        }
        
        frame(text: 'background images') {
          ['italy', 'france', 'mexico'].each do |image_name|
            label {
              text image_name.capitalize
              image File.expand_path("images/#{image_name}.png", __dir__)
              compound 'center'
            }
          end
        }
      }
    }.open
  end
end

HelloLabel.new.launch
