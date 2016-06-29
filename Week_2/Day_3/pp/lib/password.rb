
class PasswordChecker

  def initialize(email,password)
    @password = password
    @email = email
  end

  def seven
    @password.length > 7
  end

  def symbols
    if @password.match(/[0-9]/) &&
      @password.match(/[a-z]/) &&
      @password.match(/[A-Z]/) &&
      @password.match(/[^A-Za-z0-9_]/)

      return true
    else
      return false
    end
  end

  def email

    domain = (@email.match /@\w*/).to_s.gsub!('@','')
    name = (@email.match /\w*@/).to_s.gsub!('@','')

    if (@password.match(domain) == nil) && (@password.match(name) == nil)
      return true
    else
      return false
    end

  end

  def check_password
    seven && symbols && email
  end

end
