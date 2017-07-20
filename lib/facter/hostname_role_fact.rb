# ([a-z]+)[0-9]+, i.e. www01 or logger22 have a hostname_role of www or logger
if Facter.value(:hostname) =~ /^([a-z]+)[0-9]+$/
  Facter.add('hostname_role') do
    setcode do
      $1
    end
  end

# ([a-z]+), i.e. www or logger have a hostname_role of www or logger
elsif Facter.value(:hostname) =~ /^([a-z]+)$/
  Facter.add('hostname_role') do
    setcode do
      $1
    end
  end

# Set to hostname if no patterns match
else
  Facter.add('hostname_role') do
    setcode do
      'default'
    end
  end
end
