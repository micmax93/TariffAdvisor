package pl.avd.deather.adviser.logic.question;

public class Question {
  private String question;
  private String[] values;
  private int value = 0;

  public Question(String question, String[] values) {
    this.question = question;
    this.values = values;
  }

  public String getQuestion() {
    return question;
  }

  public String[] getValues() {
    return values;
  }

  public void setValues(String[] values) {
    this.values = values;
  }

  public String getValue() {
    return values[value];
  }

  public void setValue(int value) {
    this.value = value;
  }
}
