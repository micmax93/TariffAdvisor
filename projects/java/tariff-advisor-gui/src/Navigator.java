import java.util.Iterator;
import java.util.List;

public class Navigator {
  private List<Question> questions;
  private Question current;
  private Iterator<Question> it;


  public Navigator(List<Question> questionList) {
    this.questions = questionList;
    it = questionList.iterator();
    next();
  }

  public Question next() {
    current = it.next();
    return current;
  }

  public int count() {
    return questions.size();
  }

  public boolean hasPrev() {
    if (questions.indexOf(current) > 0) {
      return true;
    } else {
      return false;
    }
  }

  public boolean hasNext(Question q) {
    return it.hasNext();
  }
}
