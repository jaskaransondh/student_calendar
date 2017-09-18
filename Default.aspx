<%--Student Name - Jaskaran Singh
Student Number - 991416308
Web Services in C# and .NET
Assignment 2--%>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assignment 2 - Web Services in C# and .NET</title>
    <link rel="stylesheet" href="css/index.css" />
    <link href='https://fonts.googleapis.com/css?family=Cairo' rel='stylesheet' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="shortcut icon" href="images/js-logo.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="head">
                <h1 id="headTitle">Sheridan Computer Club - Inquiry Form</h1>
            </div>
            <div id="content">
                <asp:Panel ID="Panel1" runat="server" BorderStyle="None" Width="395px">
                    <asp:Calendar ID="Calendar1" runat="server" BorderColor="#0000CC" BorderStyle="None" BorderWidth="1px" Caption="Bi-Weekly Meeting Calendar" Font-Names="Agency FB" Font-Size="12pt" ForeColor="Black" Height="381px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="389px" OnDayRender="Calendar1_DayRender">
                        <DayHeaderStyle BackColor="#FF9900" Font-Bold="True" Font-Size="14pt" ForeColor="Black" />
                        <DayStyle Font-Bold="True" Font-Size="Larger" Font-Underline="False" />
                        <NextPrevStyle Font-Bold="True" Font-Size="14pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#FF972D" ForeColor="White" />
                        <SelectorStyle BorderColor="#FF3300" />
                        <TitleStyle BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="18pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <br />
                    <br />
                    <asp:Button ID="btnNextmeeting" runat="server" BackColor="#56477E" BorderColor="#56477E" BorderStyle="Solid" CssClass="btnSignup" Text="NEXT MEETING" Width="394px" OnClick="btnNextmeeting_Click" />
                    <br />
                    <br />
                    <asp:Button ID="btnReset" runat="server" BackColor="#56477E" BorderColor="#56477E" BorderStyle="Solid" CssClass="btnSignup" Text="RESET CALENDAR" Width="394px" />
                    <br />
                    <br />
                    <asp:Button ID="btnSignup" runat="server" BackColor="#56477E" BorderColor="#56477E" BorderStyle="Solid" CssClass="btnSignup" EnableTheming="True" Text="I'D LIKE TO RECEIVE MORE INFORMATION" Width="394px" OnClick="btnSignup_Click1" />
                    <asp:Button ID="btnSuccess" runat="server" BackColor="#00A010" BorderColor="#00A010" BorderStyle="Solid" CssClass="btnSignup" Enabled="False" EnableTheming="True" Font-Bold="True" ForeColor="Black" OnClick="btnSignup_Click1" Text="THANK YOU! YOU WILL BE CONTACTED IN 2 DAYS." Visible="False" Width="394px" />
                    <asp:Button ID="btnProgress" runat="server" BackColor="#333333" BorderColor="#333333" BorderStyle="Solid" CssClass="btnSignup" Enabled="False" EnableTheming="True" ForeColor="White" OnClick="btnSignup_Click1" Text="Submission in progress..." Visible="False" Width="394px" />
                </asp:Panel>
                <asp:Panel ID="signupdiv" runat="server">
                    <h2 id="h1info">Sheridan Computer Club</h2>
                    <h2 id="h2info">Biweekly Club Meet</h2>
                    <p id="pinfo">
                        Sheridan Computer Club meetings are held every first and third Wednesday of every month
                        at 7pm in room S424. To know about the next meeting, click on the 'Next Meeting' button.
                    </p>
                </asp:Panel>
                <asp:Panel ID="image" runat="server">
                    <img id="cc" src="images/computer_club.png"/>
                    <br />
                    <p id="pimage">All students are eligible. Just show up at the next meeting to join!</p>
                </asp:Panel>
                <asp:Panel ID="inputform" runat="server" Visible="False">
                    <p id="formp">Please fill out the following form. All fields are required.</p>
                    <asp:Label ID="lblFirstName" runat="server" Font-Bold="True">First Name*</asp:Label>
                    <br />
                    <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                    <asp:Panel ID="FirstNameValidatorDiv" runat="server">
                        <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" ErrorMessage="Invalid first name" ControlToValidate="tbFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:Panel>
                    <asp:Label ID="lblLastName" runat="server" Font-Bold="True">Last Name*</asp:Label>
                    <br />
                    <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                    <asp:Panel ID="LastNameValidatorDiv" runat="server">
                        <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ErrorMessage="Invalid last name" ControlToValidate="tbLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:Panel>
                    <asp:Label ID="lblPhone" runat="server" Font-Bold="True">Phone*</asp:Label>
                    <br />
                    <asp:TextBox ID="tbPhone" runat="server" TextMode="Phone"></asp:TextBox>
                    <asp:Panel ID="PhoneValidatorDiv" runat="server">
                        <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ErrorMessage="Invalid phone" ControlToValidate="tbPhone" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:Panel>
                    <asp:Label ID="lblEmail" runat="server" Font-Bold="True">Email*</asp:Label>
                    <br />
                    <asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:Panel ID="EmailValidatorDiv" runat="server">
                        <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="Invalid email" ControlToValidate="tbEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:Panel>
                    <asp:Panel ID="AreasValidatorDiv" runat="server" Visible="False">
                        You must choose one of the following!
                    </asp:Panel>
                    <asp:Label ID="lblAreas" runat="server" Font-Bold="True" Text="Areas of Interest*:"></asp:Label>
                    <br />
                    <asp:CheckBox ID="cbPC" runat="server" Text="Programming Concepts" />
                    <br />
                    <asp:CheckBox ID="cbSW" runat="server" Text="Seminars/Workshops" />
                    <br />
                    <asp:CheckBox ID="cbSG" runat="server" Text="Social Gatherings" />
                    <br />
                    <asp:CheckBox ID="cbTS" runat="server" Text="Tech Support" />
                    <br />
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" BackColor="#4286F4" BorderColor="#4286F4" BorderStyle="Solid" CssClass="btnSignup" EnableTheming="True" Text="Submit" Width="146px" OnClick="btnSubmit0_Click" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" BackColor="#4286F4" BorderColor="#4286F4" BorderStyle="Solid" CssClass="btnSignup" EnableTheming="True" Text="Cancel" Width="146px" OnClick="btnCancel_Click" />
                    <asp:SqlDataSource ID="SheridanRegirstrationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SheridanConnectionString %>" DeleteCommand="DELETE FROM [Registration] WHERE [RegID] = @RegID" InsertCommand="INSERT INTO [Registration] ([FirstName], [LastName], [Phone], [Email], [PC], [SW], [SG], [TS]) VALUES (@FirstName, @LastName, @Phone, @Email, @PC, @SW, @SG, @TS)" SelectCommand="SELECT * FROM [Registration]" UpdateCommand="UPDATE [Registration] SET [FirstName] = @FirstName, [LastName] = @LastName, [Phone] = @Phone, [Email] = @Email, [PC] = @PC, [SW] = @SW, [SG] = @SG, [TS] = @TS WHERE [RegID] = @RegID">
                        <DeleteParameters>
                            <asp:Parameter Name="RegID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Phone" Type="Int64" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="PC" Type="String" />
                            <asp:Parameter Name="SW" Type="String" />
                            <asp:Parameter Name="SG" Type="String" />
                            <asp:Parameter Name="TS" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Phone" Type="Int64" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="PC" Type="String" />
                            <asp:Parameter Name="SW" Type="String" />
                            <asp:Parameter Name="SG" Type="String" />
                            <asp:Parameter Name="TS" Type="String" />
                            <asp:Parameter Name="RegID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                </asp:Panel>
                <div id="datagrid">
                    <asp:Panel ID="Panel2" runat="server" CssClass="Panel2">
                        <span id="lbspan">View Members by Program:</span><br />
                        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Width="340px" BackColor="Silver" Font-Names="Adobe Fangsong Std R" Font-Size="Large" Height="120px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="All">All</asp:ListItem>
                            <asp:ListItem Value="PCOMP">Computer Programmer</asp:ListItem>
                            <asp:ListItem Value="PTSTC">Computer Science Technology</asp:ListItem>
                            <asp:ListItem Value="PITSS">Information Technologies Support Services</asp:ListItem>
                            <asp:ListItem Value="PSYAN">Systems Analyst</asp:ListItem>
                            <asp:ListItem Value="PTLTC">Telecommunications Technology</asp:ListItem>
                        </asp:ListBox>

                        <asp:SqlDataSource ID="SheridanListBoxDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SheridanConnectionString %>" DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @ProgramID" InsertCommand="INSERT INTO [Program] ([ProgramCode], [ProgramName]) VALUES (@ProgramCode, @ProgramName)" SelectCommand="SELECT * FROM [Program]" UpdateCommand="UPDATE [Program] SET [ProgramCode] = @ProgramCode, [ProgramName] = @ProgramName WHERE [ProgramID] = @ProgramID">
                            <DeleteParameters>
                                <asp:Parameter Name="ProgramID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ProgramCode" Type="String" />
                                <asp:Parameter Name="ProgramName" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ProgramCode" Type="String" />
                                <asp:Parameter Name="ProgramName" Type="String" />
                                <asp:Parameter Name="ProgramID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#B3ADD8" BorderStyle="None" Caption="Current Members of the Computer Club" CellPadding="5" DataSourceID="SheridanDataSource" style="margin-right: 0px" Width="337px" Font-Bold="False" ForeColor="Black" Height="312px">
                            <Columns>
                                <asp:BoundField DataField="Student Name" HeaderText="Student Name" ReadOnly="True" SortExpression="Student Name" />
                                <asp:BoundField DataField="Program" HeaderText="Program" SortExpression="Program" />
                            </Columns>
                            <FooterStyle BackColor="#56477E" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                            <HeaderStyle BackColor="#56477E" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" />
                            <PagerStyle BackColor="#56477E" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="New" runat="server" ConnectionString="<%$ ConnectionStrings:SheridanConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>

                        <asp:SqlDataSource ID="SheridanDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SheridanConnectionString %>" SelectCommand="SELECT Student.FirstName + ' ' + Student.LastName AS 'Student Name', Program.ProgramCode AS Program FROM Program INNER JOIN Student ON Program.ProgramID = Student.ProgramID"></asp:SqlDataSource>

                    </asp:Panel>
                </div>
                <br />
                <asp:Panel ID="viewRegistrations" runat="server">
                    <asp:Panel ID="divToggle" runat="server">
                        <asp:Button ID="btnToggle" runat="server" Text="+" BorderColor="Black" BorderStyle="Solid" Font-Names="Adobe Arabic" OnClick="btnToggle_Click" />
                    </asp:Panel>
                    <asp:Panel ID="gridview2" runat="server">
                        <asp:GridView ID="GridView3" runat="server" DataSourceID="SheridanRegirstrationDataSource" CellPadding="6" Visible="False" Caption="Members who recently signed up:">
                        </asp:GridView>
                    </asp:Panel>
                </asp:Panel>
            </div>
            <div id="foot">
                <div id="div1">
                    <span id="info">Sheridan Computer Club meeting are held every first and third Wednesday of every month
                    at 7pm in room S424. Students enrolled in mobile computing are eligible to join.
                               <br />
                        To sign up, just show up at the next meeting and get enrolled.
                        <br />
                        Free food and fun activities.
                    </span>
                </div>
                <div id="sheridan">
                    <img id="s" src="images/sheridan.png" />
                </div>
                <div id="social">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                    <a href="#" class="fa fa-google"></a>
                    <a href="#" class="fa fa-linkedin"></a>
                    <a href="#" class="fa fa-youtube"></a>
                    <a href="#" class="fa fa-instagram"></a>
                    <br />
                    <span id="last">&copy;</span>Jaskaran Singh (991416308 | sing3792)
                </div>
            </div>
        </div>
    </form>
</body>
</html>
