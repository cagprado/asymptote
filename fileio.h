/******
  * fileio.h
  * Tom Prince and John Bowman 2004/05/10
  *
  * Handle input/output
  ******/

#ifndef FILEIO_H
#define FILEIO_H

#include <fstream>
#include <iostream>
#include <sstream>

#include "common.h"

#ifdef HAVE_RPC_RPC_H
#include "xstream.h"
#endif

#include "pair.h"
#include "triple.h"
#include "guide.h"
#include "pen.h"

#include "camperror.h"
#include "interact.h"
#include "errormsg.h"
#include "util.h"
#include "process.h"

namespace vm {
  extern bool indebugger;  
}

namespace camp {

extern string tab;
extern string newline;
  
class file : public gc {
protected:  
  string name;
  Int nx,ny,nz;    // Array dimensions
  bool linemode;   // Array reads will stop at eol instead of eof.
  bool csvmode;    // Read comma-separated values.
  bool wordmode;   // Delimit strings by white space instead of eol.
  bool singlereal; // Read/write single-precision XDR/binary reals.
  bool singleint;  // Read/write single-precision XDR/binary ints.
  bool closed;     // File has been closed.
  bool check;      // Check whether input file exists.
  bool standard;   // Standard input/output
  bool binary;     // Read in binary mode.
  
  bool nullfield;  // Used to detect a final null field in csv+line mode.
  string whitespace;
  size_t index;	   // Terminator index.
public: 

  bool Standard() {return standard;}
  
  void standardEOF() {
#if defined(HAVE_LIBREADLINE) && defined(HAVE_LIBCURSES)
    cout << endl;
#endif	
  }
  
  template<class T>
  void purgeStandard(T&) {
    if(standard) {
      int c;
      if(cin.eof())
	standardEOF();
      else {
	cin.clear();
	while((c=cin.peek()) != EOF) {
	  cin.ignore();
	  if(c == '\n') break;
	}
      }
    }
  }
  
  void purgeStandard(string&) {
    if(cin.eof())
      standardEOF();
  }
  
  void dimension(Int Nx=-1, Int Ny=-1, Int Nz=-1) {nx=Nx; ny=Ny; nz=Nz;}
  
  file(const string& name, bool check=true, bool binary=false,
       bool closed=false) : 
    name(name), linemode(false), csvmode(false),
    singlereal(false), singleint(true),
    closed(closed), check(check), standard(name.empty()),
    binary(binary), nullfield(false), whitespace("") {dimension();}
  
  virtual void open() {}
  
  void Check() {
    if(error()) {
      ostringstream buf;
      buf << "Cannot open file \"" << name << "\".";
      reportError(buf);
    }
  }
  
  virtual ~file() {}

  virtual const char* Mode() {return "";}

  bool isOpen() {
    if(closed) {
      ostringstream buf;
      buf << "I/O operation attempted on ";
      if(name != "") buf << "closed file \'" << name << "\'.";
      else buf << "null file.";
      reportError(buf);
    }
    return true;
  }
		
  string filename() {return name;}
  virtual bool eol() {return false;}
  virtual bool nexteol() {return false;}
  virtual bool text() {return false;}
  virtual bool eof() {return true;}
  virtual bool error() {return true;}
  virtual void close() {}
  virtual void clear() {}
  virtual void precision(Int) {}
  virtual void flush() {}
  virtual size_t tell() {return 0;}
  virtual void seek(Int, bool=true) {}
  
  void unsupported(const char *rw, const char *type) {
    ostringstream buf;
    buf << rw << " of type " << type << " not supported in " << Mode()
	<< " mode.";
    reportError(buf);
  }
  
  void noread(const char *type) {unsupported("Read",type);}
  void nowrite(const char *type) {unsupported("Write",type);}
  
  virtual void Read(bool&) {noread("bool");}
  virtual void Read(Int&) {noread("Int");}
  virtual void Read(double&) {noread("real");}
  virtual void Read(float&) {noread("real");}
  virtual void Read(pair&) {noread("pair");}
  virtual void Read(triple&) {noread("triple");}
  virtual void Read(char&) {noread("char");}
  virtual void Read(string&) {noread("string");}
  virtual void readwhite(string&) {noread("string");}
  
  virtual void write(bool) {nowrite("bool");}
  virtual void write(Int) {nowrite("Int");}
  virtual void write(double) {nowrite("real");}
  virtual void write(const pair&) {nowrite("pair");}
  virtual void write(const triple&) {nowrite("triple");}
  virtual void write(const string&) {nowrite("string");}
  virtual void write(const pen&) {nowrite("pen");}
  virtual void write(guide *) {nowrite("guide");}
  virtual void write(const transform&) {nowrite("transform");}
  virtual void writeline() {nowrite("string");}
  
  virtual void ignoreComment() {};
  virtual void csv() {};
  
  template<class T>
  void ignoreComment(T&) {
    ignoreComment();
  }
  
  void ignoreComment(string&) {}
  void ignoreComment(char&) {}
  
  template<class T>
  void read(T& val) {
    if(binary) Read(val);
    else {
      if(standard) clear();
      if(errorstream::interrupt) throw interrupted();
      else {
	ignoreComment(val);
	val=T();
	if(!nullfield)
	  Read(val);
	csv();
	whitespace="";
      }
    }
  }
  
  Int Nx() {return nx;}
  Int Ny() {return ny;}
  Int Nz() {return nz;}
  
  void LineMode(bool b) {linemode=b;}
  bool LineMode() {return linemode;}
  
  void CSVMode(bool b) {csvmode=b; if(b) wordmode=false;}
  bool CSVMode() {return csvmode;}
  
  void WordMode(bool b) {wordmode=b; if(b) csvmode=false;}
  bool WordMode() {return wordmode;}
  
  void SingleReal(bool b) {singlereal=b;}
  bool SingleReal() {return singlereal;}
  
  void SingleInt(bool b) {singleint=b;}
  bool SingleInt() {return singleint;}
};

class ifile : public file {
protected:  
  istream *stream;
  std::fstream *fstream;
  char comment;
  std::ios::openmode mode;
  bool comma;
  
public:
  ifile(const string& name, char comment, bool check=true,
	std::ios::openmode mode=std::ios::in) :
    file(name,check), stream(NULL), fstream(NULL), comment(comment), mode(mode),
    comma(false) {
    stream=&cin;
  }
  
  // Binary file
  ifile(const string& name, bool check=true,
	std::ios::openmode mode=std::ios::in) :
    file(name,check,true), mode(mode) {}
  
  ~ifile() {close();}
  
  void open() {
    if(standard) {
      if(mode & std::ios::binary) 
	reportError("Cannot open standard input in binary mode");
      stream=&cin;
    } else {
      stream=fstream=new std::fstream(name.c_str(),mode);
      if(mode & std::ios::out) {
	checkLocal(name);
	if(error()) {
	  delete fstream;
	  std::ofstream f(name.c_str());
	  f.close();
	}
	stream=fstream=new std::fstream(name.c_str(),mode);
      }
      index=processData().ifile.add(fstream);
      if(check) Check();
    }
  }
  
  const char* Mode() {return "input";}
  
  bool eol();
  bool nexteol();
  
  bool text() {return true;}
  bool eof() {return stream->eof();}
  bool error() {return stream->fail();}
  
  void close() {
    if(!standard && fstream) {
      fstream->close();
      closed=true;
      delete fstream;
      fstream=NULL;
      processData().ifile.remove(index);
    }
  }
  
  void clear() {stream->clear();}
  
  void seek(Int pos, bool begin=true) {
    if(!standard && fstream) {
      clear();
      fstream->seekg(pos,begin ? std::ios::beg : std::ios::end);
    }
  }
  
  size_t tell() {
    if(fstream) 
      return fstream->tellg();
    else
      return 0;
  }
  
  void csv();
  
  virtual void ignoreComment();
  
  // Skip over white space
  void readwhite(string& val) {val=string(); *stream >> val;}
  
  void Read(bool &val) {string t; readwhite(t); val=(t == "true");}
  void Read(Int& val) {*stream >> val;}
  void Read(double& val) {*stream >> val;}
  void Read(pair& val) {*stream >> val;}
  void Read(triple& val) {*stream >> val;}
  void Read(char& val) {stream->get(val);}
  void Read(string& val);
};
  
class iofile : public ifile {
public:
  iofile(const string& name, char comment=0) : 
    ifile(name,true,comment,std::ios::in | std::ios::out) {}

  void precision(Int p) {stream->precision(p);}
  void flush() {if(fstream) fstream->flush();}
  
  void write(bool val) {*fstream << (val ? "true " : "false ");}
  void write(Int val) {*fstream << val;}
  void write(double val) {*fstream << val;}
  void write(const pair& val) {*fstream << val;}
  void write(const triple& val) {*fstream << val;}
  void write(const string& val) {*fstream << val;}
  void write(const pen& val) {*fstream << val;}
  void write(guide *val) {*fstream << *val;}
  void write(const transform& val) {*fstream << val;}
  
  void writeline() {
    *fstream << newline;
    if(errorstream::interrupt) throw interrupted();
  }
};
  
class ofile : public file {
protected:
  ostream *stream;
  std::ofstream *fstream;
  std::ios::openmode mode;
public:
  ofile(const string& name, std::ios::openmode mode=std::ios::trunc) :
    file(name), stream(NULL), fstream(NULL), mode(mode) {
    stream=&cout;
  }
  
  ~ofile() {close();}
  
  void open() {
    if(standard) {
      if(mode & std::ios::binary) 
	reportError("Cannot open standard output in binary mode");
      stream=&cout;
    } else {
      checkLocal(name);
      stream=fstream=new std::ofstream(name.c_str(),mode | std::ios::trunc);
      index=processData().ofile.add(fstream);
      Check();
    }
  }
  
  const char* Mode() {return "output";}

  bool text() {return true;}
  bool eof() {return stream->eof();}
  bool error() {return stream->fail();}
  
  void close() {
    if(!standard && fstream) {
      fstream->close();
      closed=true;
      delete fstream;
      fstream=NULL;
      processData().ofile.remove(index);
    }
  }
  void clear() {stream->clear();}
  void precision(Int p) {stream->precision(p);}
  void flush() {stream->flush();}
  
  void seek(Int pos, bool begin=true) {
    if(!standard && fstream) {
      clear();
      fstream->seekp(pos,begin ? std::ios::beg : std::ios::end);
    }
  }
  
  size_t tell() {
    if(fstream) 
      return fstream->tellp();
    else
      return 0;
  }
  
  void write(bool val) {*stream << (val ? "true " : "false ");}
  void write(Int val) {*stream << val;}
  void write(double val) {*stream << val;}
  void write(const pair& val) {*stream << val;}
  void write(const triple& val) {*stream << val;}
  void write(const string& val) {*stream << val;}
  void write(const pen& val) {*stream << val;}
  void write(guide *val) {*stream << *val;}
  void write(const transform& val) {*stream << val;}
  
  void writeline();
};

class ibfile : public ifile {
public:
  ibfile(const string& name, bool check=true,
	 std::ios::openmode mode=std::ios::in) : 
    ifile(name,check,mode | std::ios::binary) {}
  template<class T>
  void iread(T& val) {
    val=T();
    fstream->read((char *) &val,sizeof(T));
  }
  
  void Read(bool& val) {iread(val);}
  void Read(Int& val) {
    if(singleint) {int ival; iread(ival); val=ival;}
    else iread(val);
  }
  void Read(char& val) {iread(val);}
  void Read(string& val) {iread(val);}
  
  void Read(double& val) {
    if(singlereal) {float fval; iread(fval); val=fval;}
    else iread(val);
  }
};
  
class iobfile : public ibfile {
public:
  iobfile(const string& name) : ibfile(name,true,std::ios::in | std::ios::out)
  {}

  void flush() {if(fstream) fstream->flush();}
  
  template<class T>
  void iwrite(T val) {
    fstream->write((char *) &val,sizeof(T));
  }
  
  void write(bool val) {iwrite(val);}
  void write(Int val) {
    if(singleint) iwrite(intcast(val));
    else iwrite(val);
  }
  void write(const string& val) {iwrite(val);}
  void write(const pen& val) {iwrite(val);}
  void write(guide *val) {iwrite(val);}
  void write(const transform& val) {iwrite(val);}
  void write(double val) {
    if(singlereal) iwrite((float) val);
    else iwrite(val);
  }
  void write(const pair& val) {
    write(val.getx());
    write(val.gety());
  }
  void write(const triple& val) {
    write(val.getx());
    write(val.gety());
    write(val.getz());
  }
  void writeline() {}
};
  
class obfile : public ofile {
public:
  obfile(const string& name) : ofile(name,std::ios::binary) {}

  template<class T>
  void iwrite(T val) {
    fstream->write((char *) &val,sizeof(T));
  }
  
  void write(bool val) {iwrite(val);}
  void write(Int val) {
    if(singleint) iwrite(intcast(val));
    else iwrite(val);
  }
  void write(const string& val) {iwrite(val);}
  void write(const pen& val) {iwrite(val);}
  void write(guide *val) {iwrite(val);}
  void write(const transform& val) {iwrite(val);}
  void write(double val) {
    if(singlereal) iwrite((float) val);
    else iwrite(val);
  }
  void write(const pair& val) {
    write(val.getx());
    write(val.gety());
  }
  void write(const triple& val) {
    write(val.getx());
    write(val.gety());
    write(val.getz());
  }
  
  void writeline() {}
};
  
#ifdef HAVE_RPC_RPC_H

class ixfile : public file {
protected:  
  xdr::ioxstream *fstream;
  xdr::xios::open_mode mode;
public:
  ixfile(const string& name, bool check=true,
	 xdr::xios::open_mode mode=xdr::xios::in) :
    file(name,check,true), fstream(NULL), mode(mode) {}

  void open() {
    fstream=new xdr::ioxstream(name.c_str(),mode);
    index=processData().ixfile.add(fstream);
    if(check) Check();
  }
    
  void close() {
    if(fstream) {
      fstream->close();
      closed=true;
      delete fstream;
      fstream=NULL;
      processData().ixfile.remove(index);
    }
  }
  
  ~ixfile() {close();}
  
  const char* Mode() {return "xinput";}
  
  bool eof() {return fstream ? fstream->eof() : true;}
  bool error() {return fstream ? fstream->fail() : true;}

  void clear() {if(fstream) fstream->clear();}
  
  void seek(Int pos, bool begin=true) {
    if(!standard && fstream) {
      clear();
      fstream->seek(pos,begin ? xdr::xios::beg : xdr::xios::end);
    }
  }
  
  size_t tell() {
    if(fstream) 
      return fstream->tell();
    else
      return 0;
  }
  
  void Read(Int& val) {
    if(singleint) {int ival=0; *fstream >> ival; val=ival;}
    else {
      val=0;
      *fstream >> val;
    }
  }
  void Read(double& val) {
    if(singlereal) {float fval=0.0; *fstream >> fval; val=fval;}
    else {
      val=0.0;
      *fstream >> val;
    }
  }
  void Read(pair& val) {
    double x,y;
    Read(x);
    Read(y);
    val=pair(x,y);
  }
  void Read(triple& val) {
    double x,y,z;
    Read(x);
    Read(y);
    Read(z);
    val=triple(x,y,z);
  }
};

class ioxfile : public ixfile {
public:
  ioxfile(const string& name) : ixfile(name,true,xdr::xios::out) {}

  void flush() {if(fstream) fstream->flush();}
  
  void write(Int val) {
    if(singleint) *fstream << intcast(val);
    else *fstream << val;
  }
  void write(double val) {
    if(singlereal) *fstream << (float) val;
    else *fstream << val;
  }
  void write(const pair& val) {
    write(val.getx());
    write(val.gety());
  }
  void write(const triple& val) {
    write(val.getx());
    write(val.gety());
    write(val.getz());
  }
};
  
class oxfile : public file {
  xdr::oxstream *fstream;
public:
  oxfile(const string& name) : file(name), fstream(NULL) {}

  void open() {
    fstream=new xdr::oxstream((checkLocal(name),name.c_str()),xdr::xios::trunc);
    index=processData().oxfile.add(fstream);
    Check();
  }
  
  void close() {
    if(fstream) {
      fstream->close();
      closed=true;
      delete fstream;
      fstream=NULL;
      processData().oxfile.remove(index);
    }
  }
  
  ~oxfile() {close();}
  
  const char* Mode() {return "xoutput";}
  
  bool eof() {return fstream ? fstream->eof() : true;}
  bool error() {return fstream ? fstream->fail() : true;}
  void clear() {if(fstream) fstream->clear();}
  void flush() {if(fstream) fstream->flush();}
  
  void seek(Int pos, bool begin=true) {
    if(!standard && fstream) {
      clear();
      fstream->seek(pos,begin ? xdr::xios::beg : xdr::xios::end);
    }
  }
  
  size_t tell() {
    if(fstream) 
      return fstream->tell();
    else
      return 0;
  }
  
  void write(Int val) {
    if(singleint) *fstream << intcast(val);
    else *fstream << val;
  }
  void write(double val) {
    if(singlereal) *fstream << (float) val;
    else *fstream << val;
  }
  void write(const pair& val) {
    write(val.getx());
    write(val.gety());
  }
  void write(const triple& val) {
    write(val.getx());
    write(val.gety());
    write(val.getz());
  }
};

#endif

extern ofile Stdout;
extern file nullfile;

} // namespace camp

#endif // FILEIO_H
