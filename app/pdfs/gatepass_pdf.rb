require 'arabic-letter-connector'

class GatepassPdf < Prawn::Document
  def initialize(gatepass)
    super(top_margin: 70)
    self.font_families.update(
          "mirza" => {
            :normal => "app/assets/fonts/Mirza-Regular.ttf",
            :bold   => "app/assets/fonts/Mirza-Bold.ttf"
          })

    @gatepass = gatepass
    self.text_direction = :rtl

    self.font('mirza') do
      gatepass_number
      items
    end
  end

  def gatepass_number
    text "Gatepass \##{@gatepass.id} \##{t_ar(@gatepass.national.name)}", size: 30, style: :bold
  end

  def items
    move_down 20
    table item_rows do
      row(0).font_style = :bold
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
      self.column_widths = [300, 200]
    end
  end

  def item_rows
    [[t_ar("الإسم"), t_ar("الكمية")]] +
    @gatepass.items.map do |item|
      [t_ar(item.name), item.qty]
    end
  end

  def t_ar(txt)
    txt.connect_arabic_letters
  end

end
