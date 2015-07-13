trigger MaxStudents on student__c(before insert) {
    Integer maxCases = null;
    CaseSettings__c settings = CaseSettings__c.getValues('default');

    if (settings != null) {
        maxCases = Integer.valueOf(settings.MaxCases__c);
    }

    if (maxCases != null) {
        Set<Id> userIds = new Set<Id>();
        Map<Id, Integer> caseCountMap = new Map<Id, Integer>();

        for (student__c c: trigger.new) {
            userIds.add(c.OwnerId);
            caseCountMap.put(c.OwnerId, 0);
        }

        Map<Id, User> userMap = new Map<Id, User>([
            select Name
            from User
            where Id in :userIds
        ]);

        for (AggregateResult result: [
            select count(Id),
                OwnerId
            from student__c
            where CreatedDate = THIS_MONTH and
                OwnerId in :userIds
            group by OwnerId
        ]) {
            caseCountMap.put((Id) result.get('OwnerId'), (Integer) result.get('expr0'));
        }

        for (student__c c: trigger.new) {
            caseCountMap.put(c.OwnerId, caseCountMap.get(c.OwnerId) + 1);

            if (caseCountMap.get(c.OwnerId) > maxCases) {
                c.addError('Too many students created this month for user ' + userMap.get(c.OwnerId).Name + '(' + c.OwnerId + '): ' + maxCases);
            }
        }
    }
}