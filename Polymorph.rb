class Document
  def initialize
  end
 
  def print
    raise NotImplementedError, 'You must implement the print method'
  end
end
 
class XmlDocument < Document

  def print
    p 'Print from XmlDocument'
  end

end

class HtmlDocument < Document
  def print
    p 'Print from HtmlDocument'
  end
end

XmlDocument.new.print # Print from XmlDocument
HtmlDocument.new.print # Print from HtmlDocument

class CCC
  def m(d)
    d.print;
  end;  
end;  

#CCC.new.m(Document.new);
CCC.new.m(XmlDocument.new);
CCC.new.m(HtmlDocument.new);
