package pptconvert;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hslf.usermodel.HSLFSlide;
import org.apache.poi.hslf.usermodel.HSLFSlideShow;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFSlide;

public class PPT2PNG {
	private static int numpgs;

	public static int getNumpgs() {
		return numpgs;
	}

	public static void setNumpgs(int numpgs) {
		PPT2PNG.numpgs = numpgs;
	}

	public static void main(String[] args) throws IOException {
		pptxConvert("FileIO.pptx","D:\\Desktop\\Classes\\A.I_Academy_projects\\JSP_work\\AIA_Project01\\src\\pptconvert");
	}
	
	public static void pptxConvert(String name, String path) throws IOException {
		FileInputStream fis = new FileInputStream(path+"\\"+name);
		
		XMLSlideShow ppt = new XMLSlideShow(fis);
		fis.close();
		
		Dimension pgsize = ppt.getPageSize();
		int idx = 1;
		
		setNumpgs(ppt.getSlides().size());
	
		for(XSLFSlide slide: ppt.getSlides()) {
			BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
			Graphics2D grs = img.createGraphics();
			grs.setPaint(Color.white);
			grs.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
			
			slide.draw(grs);
			FileOutputStream out = new FileOutputStream("D:\\Desktop\\Classes\\A.I_Academy_projects\\JSP_work\\AIA_Project01\\WebContent\\upload\\imgs\\slide-"+idx+".png");
			javax.imageio.ImageIO.write(img, "png", out);
			out.close();
			idx++;
		}
		
		ppt.close();
	}

	public static void oldPptConvert(String name) throws IOException {
		FileInputStream fis = new FileInputStream("D:\\Desktop\\Classes\\A.I_Academy_projects\\JSP_work\\AIA_Project01\\src\\pptconvert\\"+name);
		
		HSLFSlideShow ppt = new HSLFSlideShow(fis);
		fis.close();
		
		Dimension pgsize = ppt.getPageSize();
		System.out.println(pgsize.height);
		System.out.println(pgsize.width);
		int idx = 1;
		
		for(HSLFSlide slide: ppt.getSlides()) {
			BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
			Graphics2D grs = img.createGraphics();
			grs.setPaint(Color.white);
			grs.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
			
			slide.draw(grs);
			FileOutputStream out = new FileOutputStream("D:\\Desktop\\Classes\\A.I_Academy_projects\\JSP_work\\AIA_Project01\\src\\pptconvert\\old\\" +"slide-"+idx+".png");
			javax.imageio.ImageIO.write(img, "png", out);
			out.close();
			idx++;
		}
		
		ppt.close();
	}
}
