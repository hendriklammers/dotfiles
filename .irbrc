IRB.conf[:PROMPT_MODE] = :SIMPLE

def clear
  conf.return_format = ''
  system('clear')
end
