class Book < ApplicationRecord
    has_and_belongs_to_many :authors
    has_many :loans
    has_many :users, through: :loans

    has_one_attached :pdf_book
    has_one_attached :cover


    # Sacar el archivo y guardarlo en la carpeta tmp, para obtener el path del archivo
    def process_attachment
        #process_attachment 
        pdf_attachment_path = "#{Dir.tmpdir}/#{self.pdf_book.filename}" 
        File.open(pdf_attachment_path, 'wb') do |file| 
            file.write(self.pdf_book.download) 
        end
        return pdf_attachment_path 
    end 

end
