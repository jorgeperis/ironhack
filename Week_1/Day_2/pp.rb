
class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end

end

class HourlyEmployee < Employee
    def initialize(name,email,hourly_rate, hours_worked)
        super(name,email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      salary = @hourly_rate * @hours_worked
    end
end

class SalariedEmployee < Employee
  def initialize(name,email,salary)
    super(name,email)
    @salary = salary
  end

  def calculate_salary
    hi = @salary/52 #by week
  end
end

class MultiPaymentEmployee < Employee
  def initialize(name,email,salary,hourly_rate, hours_worked)
    super(name,email)
    @salary = salary
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

  def calculate_salary
    if @hours_worked > 40
      hi = (@salary/52) + ((@hours_worked - 40)*@hourly_rate)
    end
  end
end

class Payroll
  def initialize(employees)
      @employees = employees
  end

  def pay_employees
    sum = 0
    @employees.each do |x|
      puts "#{x.name} -> #{(x.calculate_salary*0.82).round(2)}"#tax rate 18%
      sum = sum + (x.calculate_salary*0.82).to_i
    end
    puts sum
  end

  def notify_employee
    @employees.each do |x|
      IO.write(x.email,"Dear #{x.name}, we have paid you #{(x.calculate_salary*0.82).to_i}$")
    end
  end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

employees = [josh, nizar, ted]
payroll = Payroll.new(employees)
payroll.pay_employees
payroll.notify_employee
