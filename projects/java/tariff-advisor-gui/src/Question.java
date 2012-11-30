public class Question {
  private String question;
  private Object[] keys;
  private String[] values;
  private int value = 0;
  private String questionKey;

  public Question(String question, String questionKey, Object[] keys, String[] values) {
    this.question = question;
    this.values = values;
    this.keys = keys;
    this.questionKey = questionKey;
  }

  public String getQuestion() {
    return question;
  }

  public String[] getValues() {
    return values;
  }

  public Object[] getKeys() {
    return keys;
  }

  public String getValue() {
    return values[value];
  }

  public Object getKey() {
    return keys[value];
  }

  public void setValue(int value) {
    this.value = value;
  }

  public String toClipsFact() {
    return "(answer (key " + questionKey + ") (value " + getKey() + "))";
  }
}
