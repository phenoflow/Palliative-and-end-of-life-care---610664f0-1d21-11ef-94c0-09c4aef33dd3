# Rebecca M Joseph, Ruth H Jack, Richard Morriss, Roger David Knaggs, Debbie Buttler, Chris Hollis, Julia Hippisley-Cox, Carrol Coupland, 2024.

import sys, csv, re

codes = [{"code":"66S3.00","system":"readv2"},{"code":"66S4.00","system":"readv2"},{"code":"M270300","system":"readv2"},{"code":"9b1C.00","system":"readv2"},{"code":"9b74.00","system":"readv2"},{"code":"9NkJ.00","system":"readv2"},{"code":"9b1B.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('palliative-and-end-of-life-care-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["palliative-and-end-of-life-care-hospice---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["palliative-and-end-of-life-care-hospice---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["palliative-and-end-of-life-care-hospice---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
