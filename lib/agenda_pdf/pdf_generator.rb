require 'prawn'

class PdfGenerator < Prawn::Document
  def initialize(path, &block)
    super()
    initialize_document

    instance_eval &block
    
    finalize_document(path)
  end

  protected

  def initialize_document; end
  
  def finalize_document(path)
    pp "Rending pdf at #{path}"
    render_file(path)
  end
end
