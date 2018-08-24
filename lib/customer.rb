require "csv"
require "pry"
require "awesome_print"

class Customer

  attr_reader :id, :email, :address
  attr_writer :email, :address

  @@customer = []

  def initialize(id, email, address)
    @id =  id.to_i
    @email = email
    @address = {:street => address[:street], :city => address[:city],  :state => address[:state], :zip => address[:zip]}
  end

  def self.all
    @@customer = CSV.open('data/customers.csv', 'r').map do |line|
      Customer.new( @id = line[0], @email = line[1],
        @address = {
          street: line[2],
          city: line[3],
          state: line[4],
          zip: line[5]
          })
        end
        return @@customer
      end


      def self.find(id)
        self.all
        return @@customer[id - 1]
        # @@customer.each do |instance|
        #   if instance.id == id
        #     return instance
        #   elsif instance.id != id
        #     return nil
          # end
      end


  end
