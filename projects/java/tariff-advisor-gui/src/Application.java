import CLIPSJNI.Environment;
import CLIPSJNI.MultifieldValue;

import javax.swing.*;
import java.util.LinkedList;
import java.util.List;

public class Application {
  private Question question = null;
  private String nextQuestionKey = null;
  private QuestionPanel questionPanel = null;
  private MainPanel mainPanel;
  private Environment clips;
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

    setupMainFrame();
    setupHandlers();
    setupClips();

    next();
  }

  private void setupClips() {
    String fileLocations[] = new String[]{
        getClass().getResource("/ui-templates.clp").getPath(),
        getClass().getResource("/fcelu.clp").getPath(),
        getClass().getResource("/pakiety.clp").getPath(),
        getClass().getResource("/taryfy.clp").getPath(),
        getClass().getResource("/ui-clips.clp").getPath(),
        getClass().getResource("/ans2f.clp").getPath(),
    };

    clips = new Environment();
    clips.clear();
    for (String f : fileLocations) {
      clips.load(f);
    }

    clips.reset();
  }

  private void setupHandlers() {
    mainPanel.addNextButtonHandler(new MainPanel.NextButtonHandler() {
      @Override
      public void onClick() {
        beforeUpdate();
        sendCurrentValue();
        next();
      }
    });

    mainPanel.addPrevButtonHandler(new MainPanel.PrevButtonHandler() {
      @Override
      public void onClick() {
        setupClips();
        next();

        beforeUpdate();
//        prev();
        updateCurrentFrame();
      }
    });
  }

  private void sendCurrentValue() {
    if (question != null) {
      String assertString = question.toClipsFact();
      System.out.println(assertString);
      clips.assertString(assertString);
    }
  }

  private void prev() {
  }

  private void next() {
    // tries to get next question, if it fails tries to get results
//    clips.run(1);
    clips.run();

    if (!nextQuestion()) {
//      beforeUpdate();
      results();
      question = null;
    }

    frame.pack();
  }

  private void results() {
    System.out.println("No more questions. Showing results.");
  }

  private boolean nextQuestion() {
    try {
      MultifieldValue v = (MultifieldValue) clips.eval("(find-all-facts ((?i ui-state)) TRUE)");
      String key = v.get(0).getFactSlot("key").toString();

      if (key.equals("question")) {
        String value = v.get(0).getFactSlot("value").toString();
        nextQuestionKey = value;
//        System.out.println("Get question: " + nextQuestionKey);

        setQuestion(QuestionBundle.valueOf(nextQuestionKey));
        updateCurrentFrame();
        return true;
      }
    } catch (Exception e) {
    }
    return false;
  }

  private void setQuestion(QuestionBundle bundle) {
    this.question = bundle.getQuestion();
    this.questionPanel = generateQuestionPanel(question);
  }

  private void beforeUpdate() {
    if (question != null) {

      question.setValue(questionPanel.getSelectedIndex());
      Object valueKey = question.getKey();
//      System.out.println("Selected: " + valueKey);
      questionPanel.getMainPanel().setVisible(false);
    }
  }

  private void setupMainFrame() {
    frame = new JFrame("Tariff Adviser");
    frame.add(mainPanel.getMainPanel());
    frame.pack();
    frame.setVisible(true);
    frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
  }

  private void updateCurrentFrame() {
//    mainPanel.setProgress(questions.size(), current + 1);
    mainPanel.setQuestionPanelContent(questionPanel.getMainPanel());
    mainPanel.getMainPanel().revalidate();

    // force refresh
    questionPanel.getMainPanel().setVisible(false);
    questionPanel.getMainPanel().setVisible(true);
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
    questionPanel.getMainPanel().setVisible(false);
    return questionPanel;
  }

}
