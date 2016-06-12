require 'rails_helper'

describe "ContactForm", type: :feature do

  describe 'Contact' do
    it 'fill form', js: true do
      visit root_path()
      within('.contact') do
        fill_in "Contact_subject", with: 'John Doe'
        fill_in "Contact_email", with: 'john_doe@example.com'
        fill_in "Contact_phone", with: '123456789'
        fill_in "Contact_content", with: 'This is Esparta!'
        find('input[type="submit"]').click
      end
      expect(page).to have_content('¡Gracias por contactar conmigo!')
    end
  end
end
