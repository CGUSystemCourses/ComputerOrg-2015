import re
import array
import sys

OP={}
OP['MOVA'] = ('0000000', 0, 1);     OP['INC'] =  ('0000001', 0, 1);     OP['ADD'] =  ('0000010', 0, 1, 2);
OP['SUB'] =  ('0000101', 0, 1, 2);  OP['DEC'] =  ('0000110', 0, 1);     OP['AND'] =  ('0001000', 0, 1, 2);
OP['OR' ] =  ('0001001', 0, 1, 2);  OP['XOR'] =  ('0001010', 0, 1, 2);  OP['NOT'] =  ('0001011', 0, 1);
OP['MOVB'] = ('0001100', 0, 2);     OP['SHR'] =  ('0001101', 0, 2);     OP['SHL'] =  ('0001110', 0, 2);
OP['LDI'] =  ('1001100', 0, 2);     OP['ADI'] =  ('1000010', 0, 1, 2);  OP['LD'] =   ('0010000', 0, 1);
OP['ST'] =   ('0100000', 1, 2);     OP['BRZ'] =  ('1100000', 0, 2);     OP['BRN'] =  ('1100001', 0, 2);
OP['JMP'] =  ('1110000', 0);

REG={}
REG['R0'] = '000';  REG['R1'] = '001';  REG['R2'] = '010';  REG['R3'] = '011';
REG['R4'] = '100';  REG['R5'] = '101';  REG['R6'] = '110';  REG['R7'] = '111';

def binary_to_int(u):
    n = 0
    for i in range(0, 8):
       if(u[i]=='1'):  n += 2**(8-i-1)
    
    return n

def read_file(filename):
    p = re.compile('[A-Z]+[\t ]*[R]?[0-7]*[ \t]*[,]?[ \t]*[R]?[-]?[0-7]*[ \t]*[,]?[ \t]*[R]?[0-7]*[ \t]*')
    f = open(filename, 'r')
    lines = [l.upper()[0:len(l)-1] for l in f.readlines()]
    
    for i in range(0, len(lines)):
        f = lines[i].find('#')
        if f!= -1: lines[i] = lines[i][0:f]
        lines[i] = lines[i].strip()


    for i in range(0, len(lines)):
        if(len(lines[i])>0):
            m = p.match(lines[i])
            if(m):
                lines[i] = m.group()
            else:
                print str(i) + ": Error Parse format " + lines[i]
                break

    return lines

def split_operand(lines):
    p = re.compile('[\t\r\n, ]*')
    op = []
    for l in lines:
        if(len(l)>0):  op.append(p.split(l))
        else:  op.append([])
    
    return op

def num_binary(num):
    n = int(num)
    if(n<0):  n = 256+n

    s = ""
    for i in range(0, 6):
        if(n%2==0):   s += '0'
        else:  s += '1'
        n/=2

    return s[::-1]


def read_operand(op):
    asm = []
    for i in range(0, len(op)):
        print "%(#)3d:" % {'#':i}, 
        print op[i]
        if len(op[i])>0 and op[i][0] in OP:
            a = OP[op[i][0]][0]
            r = []
            if(len(OP[op[i][0]]) == 4):
                r = [REG[op[i][1]], REG[op[i][2]]]
                if(op[i][0] != 'ADI'):   r.append(REG[op[i][3]])
                else:                    r.append(num_binary(op[i][3])[3:])
            
            elif(len(OP[op[i][0]]) == 3):
                if(op[i][0] == 'BRZ' or op[i][0] == 'BRN'):
                    num = num_binary(op[i][2])
                    r = [num[0:3], REG[op[i][1]], num[3:]]
                elif(op[i][0] == 'LDI'):
                    r = [REG[op[i][1]], '000', num_binary(op[i][2])[3:]]
                else:
                    r = ['000', '000', '000']
                    r[OP[op[i][0]][1]] = REG[op[i][1]]
                    r[OP[op[i][0]][2]] = REG[op[i][2]]
            
            # JMP 
            elif(len(OP[op[i][0]]) == 2):
                r = ['000', REG[op[i][1]], '000']

            asm.append(a + r[0] + r[1] + r[2])
        elif len(op[i]) == 0:
            asm.append('0000000000000000')
        else:
            print str(i) + ": operand error, not exsist op " + op[i][0]
            break
    
    return asm


def asm_to_mem_file(output_name, asm):
    f = open(output_name, 'w')
    for a in asm:
        f.write(a + '\n')

    f.write('1111111111111111\n')
    for i in range(0, 256-len(asm)-1):
        f.write('0000000000000000\n')

    f.close()

def test_print(op_lines, asm):
    print "\nFinal Result"
    for i in range(0, len(asm)):
        print "%(#)3d:" % {'#':i},
        print asm[i][0:7] + " " + asm[i][7:10] + " " + asm[i][10:13] + " " + asm[i][13:16] + "\t",
        for e in op_lines[i]:
            print e + "\t",
        
        print ''
    
    print "%(#)3d: " % {'#':len(asm)} + "1111111 111 111 111\tPROGRAM END"

def main():
    if len(sys.argv)>1:
        input_name = sys.argv[1]
    else:
        input_name = 'test.asm'

    output_mem_name = ''
    if input_name.endswith('.asm'): output_mem_name = input_name[0:len(input_name)-4] + '.mem'
    else:                           output_mem_name = input_name + '.mem'
    
    lines = read_file(input_name)
    op_lines = split_operand(lines)
    asm = read_operand(op_lines)
    asm_to_mem_file(output_mem_name, asm)
    
    test_print(op_lines, asm) # Just for test print, do nothing


if __name__ == "__main__":
    main()
