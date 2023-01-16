module Printable

    module Format
        def text_to_int(text)
            text.gsub(/[\s,]/, "").to_i
        end
    end

end





    # usa_confirmed_cases doc.css(".maincounter-number")[0].text.gsub(/[\s,]/, "").to_i
    # usa_overall_deaths doc.css(".maincounter-number")[1].text.gsub(/[\s,]/, "").to_i
    # usa_recoveries doc.css(".maincounter-number")[2].text.gsub(/[\s,]/, "").to_i