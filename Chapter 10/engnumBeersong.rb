def englishNumber number
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)

#BILLIONS
  left  = number
  write = left/1000000000          # How many hundreds left to write out?
  left  = left - write*1000000000  # Subtract off those thousands.

  if write > 0
    # Now here's a really sly trick:
    bils  = englishNumber write
    numString = numString + bils + ' billion'

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

#MILLIONS

  write = left/1000000          # How many hundreds left to write out?
  left  = left - write*1000000  # Subtract off those thousands.

  if write > 0
    # Now here's a really sly trick:
    mils  = englishNumber write
    numString = numString + mils + ' million'

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end


#THOUSANDS

  write = left/1000          # How many hundreds left to write out?
  left  = left - write*1000  # Subtract off those thousands.

  if write > 0
    # Now here's a really sly trick:
    thous  = englishNumber write
    numString = numString + thous + ' thousand'

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

#HUNDREDS


  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    # Now here's a really sly trick:
    hundreds  = englishNumber write
    numString = numString + hundreds + ' hundred'

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

bottles = 99
myPlural = "s"

while bottles >= 1
	puts englishNumber(bottles).capitalize + ' bottle' + myPlural + ' of beer on the wall,'
	puts englishNumber(bottles).capitalize + ' bottle' + myPlural + ' of beer.'
	puts 'Take one down, pass it around,'
	bottles = bottles - 1

	if bottles >=2
		myPlural = "s"
	else
		myPlural = ""
	end

	if bottles >=1
		puts englishNumber(bottles).capitalize + ' bottle' + myPlural + ' of beer on the wall!'
		puts nil
	end

end

#big finale
puts 'NO MORE BOTTLES OF BEER ON THE WAAAALLLLL!'
