module Printable                            # module containing formatting methods for displaying data

    module Format
        def text_to_int(text)               # formats text to integers
            text.gsub(/[\s,]/, "").to_i     # replaces whitespace and commas with nothing and converts to an intege
        end
    end

end
