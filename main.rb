# Exercise 5 Part 1 (Exception Handling)

class MentalState
    def auditable?
      # true if the external service is online, otherwise false
    end
    def audit!
      # Could fail if external service is offline
    end
    def do_work
      # Amazing stuff...
    end
  end

  def initialize(message = "Invalid Mental State")
  
  def audit_sanity(bedtime_mental_state)
    begin
      bedtime_mental_state.audit!
      MorningMentalState.new(:ok)

    rescue  InvalidMentalStateException => e
      puts("Error: #{e.message}")
      MorningMentalState.new(:not_ok)
    end
end

new_state = audit_sanity(bedtime_mental_state)
  
  
  
  
  
  # Exercise 5 Part 2 (Don't Return Null / Null Object Pattern)
  
  class BedtimeMentalState < MentalState ; end
  
  class MorningMentalState < MentalState ; end

  class InvalidMentalStateException < StandardErorr
  
  def initialize(message = "Non auditable mental state")
  
  def audit_sanity(bedtime_mental_state) raise InvalidMentalStateException, message
  
    if bedtime_mental_state.audit!.ok?
      MorningMentalState.new(:ok)
    else 
      MorningMentalState.new(:not_ok)
    end
  end
  
  begin
    new_state = audit_sanity(bedtime_mental_state)
    new_state.do_work
  rescue InvalidMentalStateException => e
    puts("Error: #{e.message}")
  end
  
  
  
  # Exercise 5 Part 3 (Wrapping APIs)
  
  require 'candy_service'

  class MachineNotPreparedExceptionException < StandardErorr ; end

  class CandyMachineWrapper
  
    def initialize 
      machine = CandyMachine.new
      message = "Machine Is Not Ready"
    end
  

    machine.prepare

    def make_candy raise MachineNotPreparedException, message
      if machine.ready?
        machine.make!
        puts("Candy is made!")
      rescue MachineNotPreparedException => e
        puts "Error: #{e.message}"
      end
l
  