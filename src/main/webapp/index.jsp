import com.github.sarxos.webcam.Webcam;
import com.github.sarxos.webcam.WebcamPanel;
import com.github.sarxos.webcam.ds.buildin.WebcamDefaultDriver;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class VideoCallingApp extends JFrame {

    private final Webcam webcam;
    private final WebcamPanel webcamPanel;

    public VideoCallingApp() {
        super("Video Calling App");

        // Initialize webcam
        Webcam.setDriver(new WebcamDefaultDriver());
        webcam = Webcam.getDefault();
        webcamPanel = new WebcamPanel(webcam);
        webcamPanel.setFPSDisplayed(true);

        // Set up the UI
        setLayout(new BorderLayout());
        add(webcamPanel, BorderLayout.CENTER);

        // Handle window close event
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                webcam.close();
                System.exit(0);
            }
        });

        setSize(640, 480);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new VideoCallingApp());
    }
}

