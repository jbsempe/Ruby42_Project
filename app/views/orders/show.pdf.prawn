#stroke_axis
text "mentalgroovevinyl.com", align: :right, size: 15, style: :bold
text "No TVA FR04533444287", align: :right, size: 9
text "Siret 53344428700023", align: :right, size: 9
text "10 Rue du Château d'Eau", align: :right, size: 9
text "Septfontaine 25270", align: :right, size: 9
text "France", align: :right, size: 9
text "Téléphone: +33 (0)1 83.95.08.33", align: :right, size: 9
text "Iban FR7612506200145604711605792", align: :right, size: 9

image_path = Rails.application.assets["logo_pdf.png"].pathname
image image_path, position: :left, vposition: :top, width: 350

position = cursor

stroke do
 self.line_width = 2
 horizontal_line 325, 540, at: 600, width: 3000
 horizontal_line 0, 215, at: 600
end

pad_top(-42) {text "DEVIS", align: :center, size: 18, style: :bold_italic}

pad_top(20) {text "N° du devis DEVIS##{@order.id}", size: 14, style: :bold, align: :right}

if @order.client.email.present?
  data =
  [
    ["Facturé à :"],
    ["#{@order.client.email}"]
  ]
  table(data, row_colors: ["F0F0F0", "FFFFFF"], width:  300, cell_style: {size: 10})
end
data =
[
  ["Date du devis", "Pack référence"],
  ["#{l(@order.created_at, format: :short)}", "#{@order.pack.description}"]
]
pad_top(30) {table(data, row_colors: ["F0F0F0", "FFFFFF"], cell_style: {width: 270, align: :center, size: 10})}

data =
[
  ["Options", "Description", "Quantité", "Taux", "Montant"],
  ["#{t("activerecord.attributes.order.format")}", "#{t("public.orders.formats.#{@order.format}")}", "", "", "#{@order.price_for(:format)} CHF"],
  ["#{t("activerecord.attributes.order.quantity")}", "#{t("public.orders.quantities.#{@order.quantity}")}", "", "", "#{@order.price_for(:quantity)} CHF"],
  ["#{t("activerecord.attributes.order.ingraving")}", "#{t("public.orders.ingravings.#{@order.ingraving}")}", "", "", "#{@order.price_for(:ingraving)} CHF"],
  ["#{t("activerecord.attributes.order.vinyl_colors")}", "#{t("public.orders.vinyls_colors.#{@order.vinyl_colors}")}", "", "", "#{@order.price_for(:vinyl_colors)} CHF"],
  ["#{t("activerecord.attributes.order.label")}", "#{t("public.orders.labels.#{@order.label}")}", "", "", "#{@order.price_for(:label)} CHF"],
  ["#{t("activerecord.attributes.order.external_sleeve")}", "#{t("public.orders.external_sleeves.#{@order.external_sleeve}")}", "", "", "#{@order.price_for(:external_sleeve)} CHF"],
  ["#{t("activerecord.attributes.order.sleeve")}", "#{t("public.orders.sleeves.#{@order.sleeve}")}", "", "", "#{@order.price_for(:sleeve)} CHF"],
  ["#{t("activerecord.attributes.order.packaging")}", "#{t("public.orders.packagings.#{@order.packaging}")}", "", "", "#{@order.price_for(:packaging)} CHF"],
  ["#{t("activerecord.attributes.order.weight")}", "#{t("public.orders.weights.#{@order.weight}")}", "", "", "#{@order.price_for(:weight)} CHF"]

]
pad_top(40) {table(data, column_widths: [120, 190, 80, 70, 80], row_colors: ["F0F0F0", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF", "FFFFFF"], cell_style: {size: 10})}

pad_top(18) {text "Total : #{@order.price}€", size: 14, style: :bold, align: :right}
if @order.client.email.present?
  stroke do
   self.line_width = 0.5
   horizontal_line 350, 540, at: 140
  end
else
  stroke do
   self.line_width = 0.5
   horizontal_line 350, 540, at: 180
  end
end
pad_top(0) {text "Nous restons a votre disposition pour tout renseignement.", size: 10}
pad_top(5) {text "oliver@mentalgroove.ch", size: 10}
pad_top(25) {text "Conditions d'utilisation", size: 13, style: :bold}
pad_top(5) {text "Pour toutes commandes une autorisation de pressage (SDRM, SUISA...) est nécessaire.", size: 10}
pad_top(2) {text "La production commence à réception de vos fichiers audio & visuels et de votre paiement.", size: 10}

