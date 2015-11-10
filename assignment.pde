ArrayList<assignment> chart = new ArrayList<assignment>();

void setup()
{
  size(500, 500);
  smooth();
  
  loadExpenses();
}

void loadExpenses()
{
  String[] lines = loadStrings("music.txt");
  for (int i = 0 ; i < lines.length ; i ++)
  {
    charts chart = new charts(lines[i]);
    chart.add(expense);
  }
  
  
void drawPartyBars()
{
  float gap = (float) width / partyExpenses.size();
  float max = Float.MIN_VALUE;
  for (PartyExpense partyExpense:partyExpenses)
  {
    if (partyExpense.total > max)
    {
      max = partyExpense.total;
    }
  }
  
  float scaleFactor = (float) height / max;  
  for (int i = 0 ; i < partyExpenses.size() ; i ++)
  {
    PartyExpense partyExpense = partyExpenses.get(i);
    stroke(partyExpense.colour);
    fill(partyExpense.colour);
    float x = i * gap;
    rect(x, height, gap, - (partyExpense.total * scaleFactor));
    stroke(255);
    fill(255);
    text(partyExpense.name, x, height - 20);
  }
}

void drawExpenseBars()
{
  float gap = (float) width / expenses.size();
  float max = Float.MIN_VALUE;
  for (Expense expense:expenses)
  {
    if (expense.total > max)
    {
      max = expense.total;
    }
  }
  
  float scaleFactor = (float) height / max;  
  for (int i = 0 ; i < expenses.size() ; i ++)
  {
    Expense expense = expenses.get(i);
    stroke(expense.colour);
    fill(expense.colour);
    float x = i * gap;
    rect(x, height, gap, - (expense.total * scaleFactor));
  }
}

int which = 0;

void draw()
{
  background(0);
  if(keyPressed)
  {
    if (key == '0')
    {
      which = 0;
    }
    if (key == '1')
    {
      which = 1;
    }
  }
  if (which == 0)
  {
    drawExpenseBars();
  }
  else
  {
    drawPartyBars();
  }  
}
