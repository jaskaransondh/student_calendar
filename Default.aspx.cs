/*
 * Student Name - Jaskaran Singh 
 * Student Number - 991416308
 * Web Services in C# and .NET
 * Assignment 2
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    //MUTLI DIMENSIONAL ARRAY TO ADD LABELS TO THE CALENDAR ON MEETING DAY
    string[,] holidays = new String[13, 32];

    //LOCAL DATASET TO ACT AS A TABLE
    private SheridanDataSet sds = new SheridanDataSet();

    //TABLE ADAPTER TO INTERACT WITH THE LOCAL DATASET AND THE PHYSICAL SOURCE, PARTICULARILY FOR STUDENT TABLE
    private SheridanDataSetTableAdapters.StudentTableAdapter taStudent = new SheridanDataSetTableAdapters.StudentTableAdapter();

    //TABLE ADAPTER TO INTERACT WITH THE LOCAL DATASET AND THE PHYSICAL SOURCE, PARTICULARILY FOR REGISTRATION TABLE
    private SheridanDataSetTableAdapters.RegistrationTableAdapter taRegistration = new SheridanDataSetTableAdapters.RegistrationTableAdapter();

    //Page_Load method. But not  rendering anything at the time of the page is loaded.
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //Calendar's SelectionChanged event handler. I had a different approach but then I decided to leave it empty.
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }

    //SelectionChanged event handler for the ListBox containing Program Names.
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Taking ListBox selection value as 'value'
        string value = ListBox1.SelectedValue.ToString();

        //if 'All' is selected the GridView displays all the records that are there in the student table
        if (value.Equals("All"))
        {
            this.SheridanDataSource.SelectCommand = "SELECT Student.FirstName + ' ' + Student.LastName AS 'Student Name', Program.ProgramCode AS Program "
            + "FROM Program INNER JOIN Student ON Program.ProgramID = Student.ProgramID ;";
        }

        //Otherwise it gets the ListBox item's value and then run the select query with where clause.
        else
        {
            this.SheridanDataSource.SelectCommand = "SELECT Student.FirstName + ' ' + Student.LastName AS 'Student Name', Program.ProgramCode AS Program "
            + "FROM Program INNER JOIN Student ON Program.ProgramID = Student.ProgramID "
            + "WHERE Program.ProgramCode = '" + value + "';";
        }

        //**** WANTED TO USE TABLE ADAPTER QUERIES BUT COULDN'T GET THE GRIDVIEW TO REFRESH ****\\

        //tbFirstName.Text = "Hi" + value;
        //sds.Student.Clear();
        //taStudent.FillByProgramID(sds.Student, value);
        //taStudent.GetDataByProgramID(value);
        //GridView3.DataSource = sds;
        //GridView3.DataMember = "Student";
        //GridView3.DataBind();
    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {

    }

    //Event handler for 'I'D LIKE TO RECEIVE MORE INFORMATION' button.
    protected void btnSignup_Click1(object sender, EventArgs e)
    {
        signupdiv.Visible = false;
        image.Visible = false;
        inputform.Visible = true;
        btnSignup.Visible = false;
        btnProgress.Visible = true;
    }

    //Event handler if user wants to cancel the process of submission.
    //In that case, the input form is hidden and the normal state is shown.
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        signupdiv.Visible = true;
        image.Visible = true;
        inputform.Visible = false;
        btnProgress.Visible = false;
        btnSuccess.Visible = false;
        btnSignup.Visible = true;
    }

    //This is the event handler for submit button, when the user has filled in the information and hits submit.
    protected void btnSubmit0_Click(object sender, EventArgs e)
    {

        //Not using CheckBoxList for convienience's sake. Therefore, validating if at least one of the checkboxes is checked.
        if (!cbPC.Checked && !cbSG.Checked && !cbSW.Checked && !cbTS.Checked){
            
            //Unhides the panel that prompts to choose at least one of the checkboxes.
            AreasValidatorDiv.Visible = true;
        }

        //When at least one of the areas of interest is chosen
        else
        {
            //Fetching the latest copy of the Registration table into the local cache.
            taRegistration.Fill(sds.Registration);

            //Creating a new row to be filled with the new user information to be added to the Registration table.
            SheridanDataSet.RegistrationRow registrationRow = sds.Registration.NewRegistrationRow();

            //Putting the information from our textboxes into corresponding table columns respectively.
            registrationRow.FirstName = tbFirstName.Text;
            registrationRow.LastName = tbLastName.Text;
            registrationRow.Phone = Convert.ToInt64(tbPhone.Text);
            registrationRow.Email = tbEmail.Text;

            //The default value for the checkboxes columns in my local registration table is 0.
            //So even if the value is not set for the checkboxes, meaning if they are unchecked 
            //the default value entered will be 0.
            //But for your database's sake, I will assign the value 0 manually if the checkbox is not selected.
            if (cbPC.Checked)
                registrationRow.PC = "1";
            else
                registrationRow.PC = "0";

            if (cbSG.Checked)
                registrationRow.SG = "1";
            else
                registrationRow.SG = "0";

            if (cbSW.Checked)
                registrationRow.SW = "1";
            else
                registrationRow.SW = "0";

            if (cbTS.Checked)
                registrationRow.TS = "1";
            else
                registrationRow.TS = "0";

            //Adding the newly created RegistrationRow into the dataset, which is our local copy.
            sds.Registration.Rows.Add(registrationRow);

            //Updating the table adapter so that the data could be synced with the physical storage.
            taRegistration.Update(sds.Registration);

            //Now this is the final step of the actual process, that is to make the 
            //GridView display the latest information
            GridView3.DataBind();

            //Making the input form go away and display the thank you message.
            btnSignup.Visible = false;
            btnProgress.Visible = false;
            inputform.Visible = false;
            btnSuccess.Visible = true;
            signupdiv.Visible = true;
            image.Visible = true;
        }
    }

    //This is the event handler for the '+' button right in the middle, right above the footer.
    //This button displays the GridView that shows the users who signed up in the past.
    protected void btnToggle_Click(object sender, EventArgs e)
    {
        if (btnToggle.Text == "+")
        {
            btnToggle.Text = "-";
            GridView3.Visible = true;
        }
        else
        {
            btnToggle.Text = "+";
            GridView3.Visible = false;
        }
    }

    //Using the Calendar DayRender event handler so that changes can be reflected the calendar itself.
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        string aHoliday;

        //Creating a new instance of DateTime object.
        DateTime theDate = e.Day.Date;

        //Adding labels to a particular day in the calendar.
        aHoliday = holidays[theDate.Month, theDate.Day];
        if (aHoliday != null)
        {
            Label aLabel = new Label();
            aLabel.Text = " <br>" + aHoliday;
            e.Cell.Controls.Add(aLabel);
            e.Cell.BorderStyle = System.Web.UI.WebControls.BorderStyle.Solid;
            e.Cell.BorderColor = System.Drawing.Color.Red;
        }
    }

    //This is the event handler for the 'Next Meeting' button, to actually 
    //initialize the calculation of the next meeting details.
    protected void btnNextmeeting_Click(object sender, EventArgs e)
    {

        //Getting the current year but naming it as the year to be calculated.
        int destYear = DateTime.Now.Year;

        //Getting the current month but naming it as the month to be calculated based on the current date.
        int destMonth = DateTime.Now.Month;

        //Getting the date today.
        int today = DateTime.Now.Day;

        //If today is already past the first and the third wednesday, increment the month by one.
        if (today > 22)
            destMonth += 1;

        //If today is already past the first and the third wednesday and its the month is 12, 
        //then increment the year and set the month to 1.
        if (destMonth == 12 && today > 22)
        {
            destMonth = 1;
            destYear += 1;
        }

        //Creating a DateTime object named 'firstWed and thirdWed' which are yet to be calculated.
        DateTime firstWed = new DateTime(destYear, destMonth, 1);

        //As, the 3rd Wednesday cannot exist before date 15, therefore for the 3rd Wednesday, starting checking from 15.
        DateTime thirdWed = new DateTime(destYear, destMonth, 15);

        //If the day of the week is not a Wednesday on a given date, the date gets incremented 
        //until the day on a given date is a Wednesday. So this calculates our first Wednesday.
        while (firstWed.DayOfWeek != DayOfWeek.Wednesday)
        {
            firstWed = firstWed.AddDays(1);
        }

        //Now if the day of the week is not a Wednesday on a given date, the date gets incremented
        // but this time, it starts checking from 15 because the 3rd Wednesday cannot exist before 15, 
        // or any other day for that matter.
        while (thirdWed.DayOfWeek != DayOfWeek.Wednesday)
        {
            thirdWed = thirdWed.AddDays(1);
        }

        //Now, if today is smaller than the first Wednesday to come, it puts the label on the calendar.
        if (firstWed.Day > DateTime.Now.Day)
            holidays[firstWed.Month, firstWed.Day] = "Club Meeting";

        //And, if the third Wednesday is also yet to come, it puts the label on the calendar for that day too.
        if (thirdWed.Day > DateTime.Now.Day)
            holidays[thirdWed.Month, thirdWed.Day] = "Club Meeting";
    }
}