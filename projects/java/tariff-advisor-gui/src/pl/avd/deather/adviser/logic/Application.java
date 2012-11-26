package pl.avd.deather.adviser.logic;

import pl.avd.deather.adviser.gui.main.MainPanel;
import pl.avd.deather.adviser.gui.question.QuestionPanel;
import pl.avd.deather.adviser.logic.question.Question;

import javax.swing.*;
import java.util.LinkedList;
import java.util.List;

public class Application {

  private int current = 0;
  private List<Question> questions;
  private List<QuestionPanel> questionPanels;
  private MainPanel mainPanel;
  private JFrame frame;

  public static void main(String[] args) {
    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        new Application();
      }
    });
  }

  public Application() {
    mainPanel = new MainPanel();
    questions = generateQuestions();
    questionPanels = generateQuestionPanels(questions);
    setupMainFrame();
    setupProgress();
    setupHandlers();
    updateCurrentFrame();
  }

  private void setupProgress() {

  }

  private void setupHandlers() {
    mainPanel.addNextButtonHandler(new MainPanel.NextButtonHandler() {
      @Override
      public void onClick() {
        current++;
        if (current >= questions.size()) {
          current = 0;
        }
        updateCurrentFrame();
      }
    });

    mainPanel.addPrevButtonHandler(new MainPanel.PrevButtonHandler() {
      @Override
      public void onClick() {
        current--;
        if (current < 0) {
          current = questions.size() - 1;
        }
        updateCurrentFrame();
      }
    });
  }

  private void setupMainFrame() {
    frame = new JFrame("Tariff Adviser");
    frame.add(mainPanel.getMainPanel());
    frame.pack();
    frame.setVisible(true);
    frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
  }

  private void updateCurrentFrame() {
    mainPanel.setProgress(questions.size(), current+1);
    mainPanel.setQuestionPanelContent(questionPanels.get(current).getMainPanel());
    mainPanel.getMainPanel().revalidate();

    // force refresh
    questionPanels.get(current).getMainPanel().setVisible(false);
    questionPanels.get(current).getMainPanel().setVisible(true);
  }

  private List<QuestionPanel> generateQuestionPanels(List<Question> questions) {
    List<QuestionPanel> panels = new LinkedList<QuestionPanel>();
    for (Question q : questions) {
      panels.add(generateQuestionPanel(q));
    }
    return panels;
  }

  private QuestionPanel generateQuestionPanel(Question q) {
    QuestionPanel questionPanel = new QuestionPanel();
    questionPanel.setQuestions(q.getQuestion(), q.getValues());
    return questionPanel;
  }

  private List<Question> generateQuestions() {
    List<Question> q = new LinkedList<Question>();

    q.add(new Question("Ala ma kota?", new String[]{
        "tak",
        "nie",
        "nie wiem"
    }));

    q.add(new Question("A my ile mamy nóg?", new String[]{
        "No?",
        "No ile mamy nóg?",
        "Nie słyszałem..."
    }));

    q.add(new Question("Ile nóg ma padalec?", new String[]{
        "3 razy 6 czyli 18",
        "21",
        "Aj tak, tak."
    }));

    return q;
  }

}
