Vim�UnDo� ��Y:W7�_�����]���~q.���`W7   |                                  W�>�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             W�<e     �                   5�_�                    F        ����                                                                                                                                                                                                                                                                                                                                                             W�<y    �   |   ~          �                                                                                                                                                                                                        }�   {   }          �                                                                                                                                                                                                      'do_cache': True�   z   |          �                                                                                                                                                                                                  'flags': final_flags,�   v   x          �                                                                                                                                                                                relative_to = DirectoryOfThisScript()�   u   w          �                                                                                                                                                                        else:�   t   v          �                                                                                                                                                                                              filename )�   s   u          �                                                                                                                                                                                                                  compilation_info.compiler_working_dir_ ),�   r   t          �                                                                                                                                                                                                      compilation_info.compiler_flags_,�   q   s          �                                                                                                                                                                                      MakeRelativePathsInFlagsAbsolute(�   m   o          �                                                                                                                                                          # Bear in mind that compilation_info.compiler_flags_ does NOT return a�   l   n          �                                                                                                                                                  if database:�   g   i          �                                                                                                                                              new_flags.append( new_flag )�   f   h          �                                                                                                                                    if new_flag:�   b   d          �                                                                                                                    path = flag[ len( path_flag ): ]�   a   c          �                                                                                                        if flag.startswith( path_flag ):�   ^   `          w                                                                                              make_next_absolute = True�   ]   _          g                                                                                  if flag == path_flag:�   Z   \          v                                                                    new_flag = os.path.join( working_directory, flag )�   X   Z          L                                                  make_next_absolute = False�   U   W          3                                    new_flag = flag�   Q   S          $                      new_flags = []�   P   R          $                        return flags�   O   Q          )                if not working_directory:�   N   P          K          def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):�   K   M          C              return os.path.dirname( os.path.abspath( __file__ ) )�   G   I                  database = None�   F   H            else:�   E   G          L      database = ycm_core.CompilationDatabase( compilation_database_folder )5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W�=%     �          }      	import os5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W�=+     �          }      mport os5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             W�=5     �              }       import ycm_core   +from clang_helpers import PrepareClangFlags       L# Set this to the absolute path to the folder (NOT the file!) containing the   I# compile_commands.json file to use that instead of 'flags'. See here for   G# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html   N# Most projects will NOT need to set this to anything; you can just change the   O# 'flags' list of compilation flags. Notice that YCM itself uses that approach.    compilation_database_folder = ''       F# These are the compilation flags that will be used in case there's no   # compilation database set.   	flags = [   V        # THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which   Q        # language to use when compiling headers. So it will guess. Badly. So C++   V        # headers will be compiled as C headers. You don't want that so ALWAYS specify           # a "-std=<something>".   P        # For a C project, you would set this to something like 'c99' instead of           # 'c++11'.           '-std=c++11',   P        # ...and the same thing goes for the magic -x option which specifies the   O        # language that the files to be compiled are written in. This is mostly   #        # relevant for c++ headers.   F        # For a C project, you would set this to 'c' instead of 'c++'.           '-x',           'c++',           '-DQT_CORE_LIB',           '-DQT_GUI_LIB',           '-DQT_NETWORK_LIB',           '-DQT_QML_LIB',           '-DQT_QUICK_LIB',           '-DQT_SQL_LIB',           '-DQT_WIDGETS_LIB',           '-DQT_XML_LIB',       0        '-I', '/usr/lib/qt/mkspecs/linux-clang',            '-I', '/usr/include/qt',   -        '-I', '/usr/include/qt/QtConcurrent',   '        '-I', '/usr/include/qt/QtCore',   '        '-I', '/usr/include/qt/QtDBus',   &        '-I', '/usr/include/qt/QtGui',   '        '-I', '/usr/include/qt/QtHelp',   -        '-I', '/usr/include/qt/QtMultimedia',   4        '-I', '/usr/include/qt/QtMultimediaWidgets',   *        '-I', '/usr/include/qt/QtNetwork',   )        '-I', '/usr/include/qt/QtOpenGL',   2        '-I', '/usr/include/qt/QtPlatformSupport',   .        '-I', '/usr/include/qt/QtPositioning',   )        '-I', '/usr/include/qt/QtScript',   .        '-I', '/usr/include/qt/QtScriptTools',   &        '-I', '/usr/include/qt/QtSql',   &        '-I', '/usr/include/qt/QtSvg',   '        '-I', '/usr/include/qt/QtTest',   *        '-I', '/usr/include/qt/QtUiTools',   %        '-I', '/usr/include/qt/QtV8',   )        '-I', '/usr/include/qt/QtWebKit',   0        '-I', '/usr/include/qt/QtWebKitWidgets',   *        '-I', '/usr/include/qt/QtWidgets',   &        '-I', '/usr/include/qt/QtXml',   .        '-I', '/usr/include/qt/QtXmlPatterns',               '-I', '.',           '-I', 'Tests',   '-I', 'build',   '-I', 'build/Tests'   ]       if compilation_database_folder:   J    database = ycm_core.CompilationDatabase( compilation_database_folder )   else:       database = None           $        def DirectoryOfThisScript():   A            return os.path.dirname( os.path.abspath( __file__ ) )           I        def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):   %            if not working_directory:                   return flags               new_flags = []   2                        make_next_absolute = False   T                          path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]   .                            for flag in flags:   /                                new_flag = flag       >                                        if make_next_absolute:   F                                            make_next_absolute = False   V                                                        if not flag.startswith( '/' ):   n                                                            new_flag = os.path.join( working_directory, flag )       d                                                                        for path_flag in path_flags:   a                                                                            if flag == path_flag:   i                                                                                make_next_absolute = True   k                                                                                                      break       �                                                                                                  if flag.startswith( path_flag ):   �                                                                                                      path = flag[ len( path_flag ): ]   �                                                                                                                            new_flag = path_flag + os.path.join( working_directory, path )   �                                                                                                                                    break       �                                                                                                                                if new_flag:   �                                                                                                                                    new_flags.append( new_flag )   �                                                                                                                                                return new_flags           �                                                                                                                                            def FlagsForFile( filename ):   �                                                                                                                                                if database:   �                                                                                                                                                    # Bear in mind that compilation_info.compiler_flags_ does NOT return a   �                                                                                                                                                              # python list, but a "list-like" StringVec object   �                                                                                                                                                                  compilation_info = database.GetCompilationInfoForFile( filename )   �                                                                                                                                                                      final_flags = PrepareClangFlags(   �                                                                                                                                                                              MakeRelativePathsInFlagsAbsolute(   �                                                                                                                                                                                  compilation_info.compiler_flags_,   �                                                                                                                                                                                  compilation_info.compiler_working_dir_ ),   �                                                                                                                                                                              filename )   �                                                                                                                                                                  else:   �                                                                                                                                                                      relative_to = DirectoryOfThisScript()   �                                                                                                                                                                                    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )       �                                                                                                                                                                                      return {   �                                                                                                                                                                                              'flags': final_flags,   �                                                                                                                                                                                              'do_cache': True   �                                                                                                                                                                                              }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v       W�=O    �                   5�_�                    @       ����                                                                                                                                                                                                                                                                                                                                                             W�>U     �   ?   A   }      '-I', 'Tests',5�_�      	              @       ����                                                                                                                                                                                                                                                                                                                                                             W�>X     �   ?   A   }      	'-I', '',5�_�                 	   A       ����                                                                                                                                                                                                                                                                                                                                                             W�>g     �   @   B   }      '-I', 'build',5�_�   	                A       ����                                                                                                                                                                                                                                                                                                                                                             W�>s     �   @   B   }      	'-I', '',5�_�                    B        ����                                                                                                                                                                                                                                                                                                                                                             W�>�    �   A   B          '-I', 'build/Tests'5�_�                    B        ����                                                                                                                                                                                                                                                                                                                                                             W�>�     �   A   C        5�_�   	       
         A       ����                                                                                                                                                                                                                                                                                                                                                             W�>o     �   @   B   }      '-I', ',5�_�   	              
   A       ����                                                                                                                                                                                                                                                                                                                                                             W�>h     �   @   B   }      '-I', ',5��