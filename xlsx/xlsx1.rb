require 'write_xlsx'
workbook=WriteXLSX.new("ruby.xlsx");

worksheet=workbook.add_worksheet

worksheet.write(0,0,"OLOLOLO")
worksheet.write('A3',0.5);
worksheet.write('A4','=SIN(A3)')

workbook.close;