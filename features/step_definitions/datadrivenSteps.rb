include DataMagic


Then(/^This is just a sample step and will output the supplied data in the console$/) do
  data = data_for('blinkx_data',{})
  puts data.to_s
end