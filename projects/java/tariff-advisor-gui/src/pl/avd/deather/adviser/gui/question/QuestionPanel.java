package pl.avd.deather.adviser.gui.question;

import javax.swing.*;
import java.awt.*;
import java.util.LinkedList;
import java.util.List;

public class QuestionPanel {
  private final int width = 400;

  private JPanel panel;
  private JLabel questionLabel;
  private JPanel answersPanel;
  private ButtonGroup group;
  private List<JRadioButton> radioButtons;
  private Component mainPanel;

  public QuestionPanel() {
    initGui();

    panel.setPreferredSize(new Dimension(width, 200));
    answersPanel.setPreferredSize(new Dimension(width, 200));
    answersPanel.setMaximumSize(new Dimension(width, 200));
  }

  private void initGui() {
    panel = new JPanel(new BorderLayout());
    questionLabel = new JLabel();

    JPanel questionLabelPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
    questionLabelPanel.setPreferredSize(new Dimension(width, 50));
    questionLabelPanel.add(questionLabel);

    answersPanel = new JPanel();
    answersPanel.setLayout(new BoxLayout(answersPanel, BoxLayout.PAGE_AXIS));

    panel.add(questionLabelPanel, BorderLayout.NORTH);
    panel.add(answersPanel, BorderLayout.CENTER);
  }

  public void setQuestions(String question, String[] answers) {
    clear();

    questionLabel.setText(question);
    questionLabel.setMinimumSize(new Dimension(width, 30));

    for (int i = 0; i < answers.length; i++) {
      createAnswer(answers[i]);
    }
    radioButtons.get(0).setSelected(true); // mark first
  }

  private void createAnswer(String answer) {
    JRadioButton r = new JRadioButton(answer);
    r.setPreferredSize(new Dimension(width, 40));
    radioButtons.add(r);
    group.add(r);

    JPanel panel = new JPanel();
    panel.setPreferredSize(new Dimension(width, 40));
    panel.setLayout(new FlowLayout());
    panel.add(r);
    answersPanel.add(panel);
  }

  private void clear() {
    this.group = new ButtonGroup();
    answersPanel.removeAll();
    radioButtons = new LinkedList<JRadioButton>();
  }

  public int getSelectedIndex() {
    int i = 0;
    for (JRadioButton b : radioButtons) {
      if (b.isSelected()) {
        return i;
      }
      i++;
    }
    return -1;
  }

  public Component getMainPanel() {
    return panel;
  }
}
