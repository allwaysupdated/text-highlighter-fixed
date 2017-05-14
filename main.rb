## (r;x) r = rad och x = radnummer
## Gör så programmet använder sig av ruby-gemen "Colorize"
require "colorize"

        ## Öppnar och läser igenom en textfil som den får från "main"(filename), sedan trycker den in all text i en sträng("unmarked_text") 
def read_file(filename:)
    unmarked_text = ""
    f = File.open(filename, "r")
    f.each_line do |line|
        unmarked_text << line
    end
  f.close
  return unmarked_text
end

            ## Indices tar en sträng("haystack") från "main" och en "needle"(som är userns input ARGV[1]) 
def indices(haystack: , needle:)
 i = 0
  output = [] ## Används senare (r;28,r;34)
  progress = 0
  while progress < haystack.to_s.length ## While loop
    if i + needle.length < haystack.length ## Kollar om "needle.length" + "i" är mindre än "haystack.length", 
      i += 1
      part = haystack[i,needle.length]   ## Om ovan (r;23) är sann så blir part en del av haystacken genom "i" och "needle.length"
      if part == needle                 ## kollar om "part" är samma som "needle"
       progress += 1
       output << i              ## "i" värde trycks in i "output"-listan
      end
    else
      progress += 1 
    end
  end
 return output
end


## Denna metoden färgar och skriver ut texten i terminalen med hjälp av ruby-gemet "colorize"
def print_highlighted_text(haystack:, indices_list:, needle:)
   progress = 0 
   index = 0
  
  while progress < haystack.length ## Whilelooop
     
      if progress == haystack[progress] ## No idea, but it works
         outputarray = haystack.split(' ')## Splittar upp "haystack" strängen till en array("outputarray")
         #progress += 1 
      else
        outputarray = haystack.split(' ')## Samma som (r;45-46)
        progress += 1 
      end
      while index < outputarray.length ## Whileloooop
        
        if needle == outputarray[index] ## Om "needle" är samma som "outputarrays" index("index")
           print outputarray[index].on_green + " " ## Färgar och skriver ut orden som ska markeras
           index +=1
        else
           print outputarray[index]  +" " ## Skriver ut det som inte ska färgas
           index +=1
        end

      end

  end

end

def main
  if ARGV[0] == "-h" ## Cool liten hjälp funktion
    system("cls")
    puts "This program is case-sensitive"
  else
    filename = ARGV[0] ## Filen
    needle = ARGV[1] ## Vad du söker efter
    haystack = read_file(filename:filename) 
    system("cls") ## Lite renare på skärmen
    indices_list = indices(haystack:haystack, needle:needle)
    print_highlighted_text(haystack:haystack ,indices_list:indices_list ,needle:needle)
  end
   
end

main ## Kallar på "main"