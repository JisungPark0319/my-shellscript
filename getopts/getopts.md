# getopt

getopt 명령은 어떤 형식으로 된 것이든 커맨드라인 옵션 및 매개변수의 목록을 받아서 적절한 형식으로 자동 변환합니다.

<center><b>getopt optstring <i>parameters</i></b></center>

- optstring이 명령 처리의 핵심입니다.
  - 커맨드라인에서 사용될 수 있는 유효한 옵션 문자를 정의합니다.
  - 어떤 옵션 문자가 매개변수 값을 요구하는지도 정의합니다.
  - 스크립트에서 사용하려는 각 커맨드라인 옵션 문자를 optstring에 나열합니다.
  - 매개변수 값이 필요한 각 옵션 문자 뒤에는 콜론을 배치합니다.

# getopts

getopt보다 몇 가지 확장 기능을 가집니다.

커맨드라인에서 발견되는 모든 옵션과 매개변수에 대한 출력을 만들어내는 getopt와 달리 getopts 명령은 존재하는 쉘 매개변수를 차례대로 처리합니다.

이 명령은 커맨드라인에서 발견되는 매개변수를 한 번 부를 때마다 하나씩 처리하고 매개변수를 모두 처리했다면 0보다 큰 종료 상태를 되돌려주면서 끝냅니다.

<center><b>getopts optstring <i>variable</i></b></center>

- optstring은 getopt명령에서 사용되는 것과 비슷합니다.
  - 유효한 옵션 글자들이 optstring에 나열되며, 매개변수 값을 필요로 하는 글자는 콜론이 따라붙습니다.
- getopts 명령은 현재 매개변수를 커맨드라인에 정의된 변수(variable)에 저장합니다.
- getopts 명령은 두 가지 환경변수를 사용합니다.
  1. OPTARG
     - 옵션이 매개변수 값을 요구하는 경우 사용될 값을 포함하고 있습니다.
  2. OPTIND
     - 매개변수 목록 안에서 getopts가 중단된 위치의 값을 포함하고 있습니다.

**Example**

```bash
!/bin/bash
while getopts :ab:c opt
do
	case "$opt" in
		a) echo "Found the -a option";;
		b) echo "Found the -b option, whith value $OPTARG";;
		c) echo "Found the -c option";;
		*) echo "Unknown option: $opt";;
  esac
done

./example.sh -ab test -c
```



