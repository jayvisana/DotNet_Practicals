Campus Feedback Portal - ASP.NET MVC 5 (.NET Framework 4.8)

HOW TO RUN
1. Extract the zip file.
2. Open Practical_7.sln in Visual Studio 2019/2022.
   Ensure the "ASP.NET and web development" workload and .NET Framework 4.8 targeting pack are installed.
3. Restore NuGet packages if Visual Studio does not do so automatically.
4. Press F5 to run with IIS Express.

FEATURES
- Separate student and teacher feedback forms.
- Required-field, email, rating, and comment-length validation.
- Bootstrap-based responsive layout.
- Success page after a valid submission.

NOTE
This practical demonstrates MVC forms and validation. Feedback submissions are currently not saved to a database; the controller only displays a confirmation message. Bootstrap and validation scripts load from CDNs, so an internet connection is needed for their styling and client-side validation.
