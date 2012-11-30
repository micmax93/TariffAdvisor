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

  private JButton resetButton;
  private JButton nextButton;
  private JPanel questionPanel;
  private JPanel mainPanel;

  public MainPanel() {
    initGui();
    mainPanel.setPreferredSize(new Dimension(620, 600));
    questionPanel.setPreferredSize(new Dimension(590, 500));
  }

  private void initGui() {
    mainPanel = new JPanel(new BorderLayout());
    questionPanel = new JPanel(new BorderLayout());
    JPanel navPanel = new JPanel(new BorderLayout(5, 5));

    mainPanel.add(questionPanel, BorderLayout.NORTH);
    mainPanel.add(navPanel, BorderLayout.SOUTH);

    resetButton = new JButton("Reset");
    nextButton = new JButton("Dalej");

    JPanel flowPanel1 = new JPanel(new FlowLayout(FlowLayout.RIGHT, 5, 5));
    JPanel flowPanel2 = new JPanel(new FlowLayout(FlowLayout.LEFT, 5, 5));

    flowPanel1.setPreferredSize(new Dimension(310, 80));
    flowPanel2.setPreferredSize(new Dimension(310, 80));

    navPanel.add(flowPanel1, BorderLayout.WEST);
    navPanel.add(flowPanel2, BorderLayout.EAST);

    flowPanel1.add(resetButton);
    flowPanel2.add(nextButton);
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
    resetButton.addActionListener(new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent e) {
        handler.onClick();
      }
    });
  }

  public void setProgress(int max, int cur) {
//    progressSlider.setMaximum(max);
//    progressSlider.setMinimum(1);
//    progressSlider.setValue(cur);
//    progressText.setText(cur + " z " + max);
  }
}
