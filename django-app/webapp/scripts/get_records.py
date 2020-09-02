#get_records.py
from records.models import Record
from frontend.models import QuestionnaireResponse
import json
#1= GO
#2= RUST
#3= FORTRAN
def run():
    rec=Record.objects.all()
    x = rec.filter
    # print(Record.objects.get_records())
    #Record.objects.filter_records_1())
    sum1=0
    q1_dict=json.loads(QuestionnaireResponse.objects.filter_records_1())
    for q1_sum in q1_dict:
        sum1+=q1_sum['response']
#    print(sum1)
    sum2=0
    q2_dict=json.loads(QuestionnaireResponse.objects.filter_records_2())
    for q2_sum in q2_dict:
        sum2+=q2_sum['response']
#    print(sum2)
    sum3=0
    q3_dict=json.loads(QuestionnaireResponse.objects.filter_records_3())
    for q3_sum in q3_dict:
        sum3+=q3_sum['response']
#    print(sum3)
    sum4=0
    q4_dict=json.loads(QuestionnaireResponse.objects.filter_records_4())
    for q4_sum in q4_dict:
        sum4+=q4_sum['response']
#    print(sum4)
    sum5=0
    q5_dict=json.loads(QuestionnaireResponse.objects.filter_records_5())
    for q5_sum in q5_dict:
        sum5+=q5_sum['response']
#    print(sum5)
    sum6=0
    q6_dict=json.loads(QuestionnaireResponse.objects.filter_records_6())
    for q6_sum in q6_dict:
        sum6+=q6_sum['response']
#    print(sum6)
    sum7=0
    q7_dict=json.loads(QuestionnaireResponse.objects.filter_records_7())
    for q7_sum in q7_dict:
        sum7+=q7_sum['response']
#    print(sum7)
    sum8=0
    q8_dict=json.loads(QuestionnaireResponse.objects.filter_records_8())
    for q8_sum in q8_dict:
        sum8+=q8_sum['response']
#    print(sum8)
    

    ##time
    tsum1=0

    tq1_dict=json.loads(Record.objects.filter_records_1())
#    print(tq1_dict)
    for tq1_sum in tq1_dict:
        tsum1+=float(tq1_sum['duration'])
#    print(tsum1)
    tsum2=0
    tq2_dict=json.loads(Record.objects.filter_records_2())
    for tq2_sum in tq2_dict:
        tsum2+=float(tq2_sum['duration'])
#    print(tsum2)
    tsum3=0
    tq3_dict=json.loads(Record.objects.filter_records_3())
    for tq3_sum in tq3_dict:
        tsum3+=float(tq3_sum['duration'])
#    print(tsum3)
    
    sum1to4=sum1+sum2+sum3+sum4
    mul5to6=sum1to4*sum5*sum6
    divtime1=mul5to6/tsum1
    mul5to7=sum1to4*sum5*sum7
    divtime2=mul5to7/tsum2
    mul5to8=sum1to4*sum5*sum8
    divtime3=mul5to8/tsum2
    print("Average weighted perfomance of GO is :")
    print(divtime1)
    print("Average weighted perfomance of RUST is :")
    print(divtime2)
    print("Average weighted perfomance of FORTRAN is :")
    print(divtime3)
    if(divtime3>divtime2 and divtime3>divtime1):
        print('FORTRAN SEEMS TO BE THE EASIEST LANGUAGE TO DEBUG WITH THE HIGHEST SCORE')
    elif (divtime1>divtime2 and divtime1>divtime3):
        print('GO SEEMS TO BE THE EASIEST LANGUAGE TO DEBUG WITH THE HIGHEST SCORE')

    else:
        print('RUST SEEMS TO BE THE EASIEST LANGUAGE TO DEBUG WITH THE HIGHEST SCORE')


