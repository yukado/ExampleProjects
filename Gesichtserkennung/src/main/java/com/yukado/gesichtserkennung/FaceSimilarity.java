/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.yukado.gesichtserkennung;

/**
 * Example showing how to use the {@link FaceSimilarityEngine} class to compare
 * faces detected in two images.
 * @author Yusuf Kagan Dogruyol
 */
import com.github.sarxos.webcam.Webcam;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map.Entry;
import javax.imageio.ImageIO;
import org.apache.commons.io.FileUtils;

import org.openimaj.feature.FloatFV;
import org.openimaj.feature.FloatFVComparison;
import org.openimaj.image.DisplayUtilities;
import org.openimaj.image.FImage;
import org.openimaj.image.ImageUtilities;
import org.openimaj.image.processing.face.detection.HaarCascadeDetector;
import org.openimaj.image.processing.face.detection.keypoints.FKEFaceDetector;
import org.openimaj.image.processing.face.detection.keypoints.KEDetectedFace;
import org.openimaj.image.processing.face.feature.FacePatchFeature;
import org.openimaj.image.processing.face.feature.FacePatchFeature.Extractor;
import org.openimaj.image.processing.face.feature.comparison.FaceFVComparator;
import org.openimaj.image.processing.face.similarity.FaceSimilarityEngine;
import org.openimaj.math.geometry.shape.Rectangle;




public class FaceSimilarity {
	/**
	 * Main Methode für das Beispiel.
	 * 
	 * @throws IOException
	 */
  
    public static int i;
    
    public static String schluessel;
    public static Double quote;
    public static String dir;
    public static Iterator it;
    
    @SuppressWarnings("empty-statement")
	public static void main(String[] args) throws IOException {
         
                // Webcam finden und öffnen
		Webcam webcam = Webcam.getDefault();
		webcam.open();
                

		// Bild mit Webcam machen
		BufferedImage image = webcam.getImage();

		// Bild als JPEG Datei speichern
		ImageIO.write(image, "JPEG", new File("C:/Users/Root/Pictures/Camera Roll/test/pctest.jpg"));
               
                
                
                // Durch Bilddateien in einem Ordner iterieren 
                Iterator it = FileUtils.iterateFiles(new File("C:/Users/Root/Pictures/Camera Roll/pcs"),new String[]{"jpg"}, true);
                // Dateinamen ausgeben und einer Variablen zuweisen
                while(it.hasNext()) {
                    
                System.out.println(((File) it.next()).getName());
                dir = (((File) it.next()).getName());

		// Bilddateien aus Variable und Aufnahme laden.
                final File sourceimage1 = new File("C:/Users/Root/Pictures/Camera Roll/test/pctest.jpg");
                final File sourceimage2 = new File("C:/Users/Root/Pictures/Camera Roll/pcs/" + dir);
		final FImage image1 = ImageUtilities.readF(sourceimage1);
		final FImage image2 = ImageUtilities.readF(sourceimage2);

		// set up eines face detectors; mit hilfe eines haar cascade detectors um Gesichter
                // zu finden, gefolgt von einem keypoint-enhanced detector um
		// keypoints für das Feature zu finden. Es gibt einige Features und Detektoren 
		// unter denen man wählen kann.
		final HaarCascadeDetector detector = HaarCascadeDetector.BuiltInCascade.frontalface_alt2.load();
		final FKEFaceDetector kedetector = new FKEFaceDetector(detector);

		// Konstruieren eines feature extractor - dieser extrahiert Pixel
		// Patches um bekannte keypoints (wie Ecken um den Mund etc.) und buldet sie in einen Vector.
		final Extractor extractor = new FacePatchFeature.Extractor();

		// um die features miteinander zu vergleichen wird die Euklidische 
                // Distanz zwischen den Punkten verwendet.
		final FaceFVComparator<FacePatchFeature, FloatFV> comparator;
            comparator = new FaceFVComparator<>(FloatFVComparison.EUCLIDEAN);

		// Jetzt wird die FaceSimilarityEngine konstruiert. It is capable of
		// Sie vergleicht die features aus zwei Gesichtern.
		final FaceSimilarityEngine<KEDetectedFace, FacePatchFeature, FImage> engine;
            engine = new FaceSimilarityEngine<>(kedetector, extractor, comparator);

		// Der Engine mitteilen, welche Bilder benutzt werden sollen:
		engine.setQuery(image1, "image1");
		engine.setTest(image2, "image2");

		// dann macht die Engine ihre Arbeit: Erfassen, Extrahieren und Vergleichen
		engine.performTest();

            // Am Ende dieses Beispiels sollen sie am meisten übereinstimmenden Gesichter 
            // auf zwei Bildern angezeigt werden. Die folgende loop geht durch die Map der
            // Gesichter im ersten Bild, um ein passendes Gesicht im zweiten zu finden:
            
                engine.getSimilarityDictionary().entrySet().stream().map((e) -> {
                // dies berechnet die kürzeste Distanz im zweiten Gesicht
                double bestScore = Double.MAX_VALUE;
                String best = null;
                
                for (final Entry<String, Double> matches : e.getValue().entrySet()) {
                    if (matches.getValue() < bestScore) {
                        bestScore = matches.getValue();
                        best = matches.getKey();
                        schluessel = best;
                        quote = bestScore;
                       
                        }
                    
                    }
                
                // hier werden die ähnlichsten 2 Gesichter auf 2 Bildern nebeneinander angezeigt:
            
                final FImage img = new FImage(image1.width + image2.width, Math.max(image1.height, image2.height));
                img.drawImage(image1, 0, 0);
                img.drawImage(image2, image1.width, 0);
                img.drawShape(engine.getBoundingBoxes().get(e.getKey()), 1F);
                final Rectangle r = engine.getBoundingBoxes().get(best);
                r.translate(image1.width, 0);
                img.drawShape(r, 1F);
                return img;
            }).forEachOrdered((FImage img) ->  {
                // am Ende wird das Ergebnis angezeigt
                while (quote < 35){
                    System.out.println("Nicht genug übereinstimmung");
                    System.out.println("Schlüssel: "+schluessel);
                    System.out.println("Quote: "+quote); 
                    DisplayUtilities.display(img);
                   
}
  });                 

}
}
}

   


