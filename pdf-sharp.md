```csharp
var document = new PdfDocument();
document.Info.Title = $"Invoice for {name}";

var page = document.AddPage();
var gfx = XGraphics.FromPdfPage(page);
var font = new XFont("Times New Roman", 12);
var boldFont = new XFont("Times New Roman", 12, XFontStyle.Bold);
var tf = new XTextFormatter(gfx);

var margin = 40d;
var width = page.Width - 2 * margin;
var colWidth = width / 2;
var rightColStart = margin + colWidth;

var invoiceNumberText = $"Invoice {invoiceNumber}";

tf.DrawString(invoiceNumberText, font, XBrushes.Black, new XRect(margin, margin, width, 40d), XStringFormats.TopLeft);

var debtorAddress = FormatAddress(debtorCompany.Name, info.RegisteredAddress);
tf.DrawString(debtorAddress, font, XBrushes.Black, new XRect(margin, margin + 40d, colWidth, 100d), XStringFormats.TopLeft);

tf.Alignment = XParagraphAlignment.Right;
var invoiceDateText = $"Page 1 of 1\nInvoice Date: {invoiceDate.ToString("dd/MM/yyyy")}";
tf.DrawString(invoiceDateText, font, XBrushes.Black, new XRect(rightColStart, margin, colWidth, 40d), XStringFormats.TopLeft);

var sellerAddress = FormatAddress(sellerCompany.Name, info.RegisteredAddress);
tf.DrawString(sellerAddress, font, XBrushes.Black, new XRect(rightColStart, margin + 40d, colWidth, 100d), XStringFormats.TopLeft);

var vatNumberHeight = margin + 140d;
var sellerVatNumberText = $"VAT Reg No. {vatNumber}";
tf.DrawString(sellerVatNumberText, font, XBrushes.Black, new XRect(margin, vatNumberHeight, width, 20d));

tf.Alignment = XParagraphAlignment.Left;
var titleHeight = margin + 180d;
tf.DrawString("Quantity", boldFont, XBrushes.Black, new XRect(margin, titleHeight, 75d, 20d));
tf.DrawString("Details", boldFont, XBrushes.Black, new XRect(margin + 75d, titleHeight, 250d, 20d));
tf.DrawString("Unit Price", boldFont, XBrushes.Black, new XRect(margin + 325d, titleHeight, 50d, 20d));
tf.DrawString("Disc Amt", boldFont, XBrushes.Black, new XRect(margin + 375d, titleHeight, 50d, 20d));
tf.DrawString("Net Amt", boldFont, XBrushes.Black, new XRect(margin + 425d, titleHeight, 50d, 20d));

tf.Alignment = XParagraphAlignment.Right;
tf.DrawString("VAT", boldFont, XBrushes.Black, new XRect(page.Width - margin - 50d, titleHeight, 50d, 20d));

var footerHeight = page.Height - margin - 100d;
var lineHeight = 20d;

tf.Alignment = XParagraphAlignment.Left;
tf.DrawString(name, font, XBrushes.Black, new XRect(margin, footerHeight, width, lineHeight));
var bankAccountTitles = "Account Number\nSort Code";
tf.DrawString(bankAccountTitles, boldFont, XBrushes.Black, new XRect(margin, footerHeight + lineHeight, 100d, lineHeight * 2));
var bankAccountDetails = $"{invoice.SellerDebtor.SellerCompany.Info.PrimaryBankAccountNumber}\n{invoice.SellerDebtor.SellerCompany.Info.PrimaryBankSortCode}";
tf.DrawString(bankAccountDetails, font, XBrushes.Black, new XRect(margin + 100d, footerHeight + lineHeight, 100d, lineHeight * 2));

var invoiceTotalTitles = "Total Discount\nTotal Net Amount\nCarriage Net\nTotal VAT Amount \nInvoice Total";
var invoiceTotalTitleColStart = page.Width - 225d;
tf.DrawString(invoiceTotalTitles, boldFont, XBrushes.Black, new XRect(invoiceTotalTitleColStart, footerHeight, 125d, lineHeight * 5));

tf.Alignment = XParagraphAlignment.Right;
var invoiceTotalValues = $"0.00\n0.00\n0.00\n0.00\n{invoice.InvoiceAmount.ToString("N2")}";
var invoiceTotalColStart = page.Width - margin - 100d;
tf.DrawString(invoiceTotalValues, font, XBrushes.Black, new XRect(invoiceTotalColStart, footerHeight, 100d, lineHeight * 2));

document.Save(stream);

return new InMemoryFile(fileName, "application/pdf", stream);

```
