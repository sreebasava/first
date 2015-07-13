trigger Test_Share on test__c (after insert) {

    // We only execute the trigger after a Test record has been inserted
    // because we need the Id of the Test record to already exist.
    if(trigger.isInsert){

    // Test_Share is the "Share" table that was created when the
    // Organization Wide Default sharing setting was set to "Private".
    // Allocate storage for a list of Test_Share records.
    List<test__share> jobShares  = new List<test__share>();

    // For each of the Test records being inserted, do the following:
    for(test__c t : trigger.new){

        // Create a new Test_Share record to be inserted in to the Test_Share table.
        test__share studentRecord = new test__share();

        // Populate the Test_Share record with the ID of the record to be shared.
        studentRecord.ParentId = t.Id;

        // Then, set the ID of user or group being granted access. In this case,
        // we're setting the Id of the student__c that was specified by
        // the Test Result in the student__c lookup field on the Test record.
        studentRecord.UserOrGroupId = t.studentid__c;

        // Specify that the Student should have edit access for
        // this particular Test record.
        studentRecord.AccessLevel = 'edit';

        // Specify that the reason the Student can edit the record is
        // because its his test result
        // (Student_Access__c is the Apex Sharing Reason that we defined earlier.)
        studentRecord.RowCause = test__share.RowCause.Student_Access__c;

        // Add the new Share record to the list of new Share records.
        jobShares.add(studentRecord);
    }

    // Insert all of the newly created Share records and capture save result
    Database.SaveResult[] jobShareInsertResult = Database.insert(jobShares,false);

    // Error handling code omitted for readability.
    }
}