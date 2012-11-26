package pl.avd.deather.adviser.gui.main;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;

public class MainPanel {
  public interface PrevButtonHandler {
    public void onClick();
  }

  public interface NextButtonHandler {
    public void onClick();
  }

  private JButton prevButton;
  private JButton nextButton;
  private JSlider progressSlider;
  private JTextField progressText;
  private JPanel questionPanel;
  private JPanel mainPanel;

  public MainPanel() {
    mainPanel.setPreferredSize(new Dimension(420, 600));
    questionPanel.setPreferredSize(new Dimension(400, 500));
  }

  public void setQuestionPanelContent(Component component) {
    questionPanel.removeAll();
    questionPanel.add(component);
    component.revalidate();
    questionPanel.revalidate();
  }

  public JPanel getMainPanel() {
    return mainPanel;
  }

  public void addNextButtonHandler(final NextButtonHandler handler) {
    nextButton.addActionListener(new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        handler.onClick();
      }
    });
  }

  public void addPrevButtonHandler(final PrevButtonHandler handler) {
    prevButton.addActionListener(new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        handler.onClick();
      }
    });
  }

  public void setProgress(int max, int cur) {
    progressSlider.setMaximum(max);
    progressSlider.setMinimum(1);
    progressSlider.setValue(cur);
    progressText.setText(cur + " z " + max);

  }
}
