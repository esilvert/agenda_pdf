require 'prawn'

class PdfGenerator < Prawn::Document
  def initialize(path, &block)
    super()
    initialize_document

    instance_eval(&block)
    
    finalize_document(path)
  end

  class << self
    def generate_month(datetime, path:)
      month = datetime.month
      year = datetime.year

      start_date = DateTime.new(year, month)
      end_date = start_date.next_month
      
      new(path) do
        (start_date..end_date).each do |day|
          text day.year.to_s
          text day.strftime('%b')
          text day.strftime('%a %d')
          start_new_page unless day == end_date
        end    
      end
    end
  end

  protected

  def initialize_document; end
  
  def finalize_document(path)
    pp "Rending pdf at #{path}"
    render_file(path)
  end
end
