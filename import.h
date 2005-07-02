/*****
 * import.h
 * Andy Hammerlindl 2003/11/09
 *
 * Defines the import class, for the import of a module into a scope,
 * and the module environment for keeping track of imports.
 *****/

#ifndef IMPORT_H
#define IMPORT_H

#include "table.h"
#include "record.h"
#include "frame.h"
#include "entry.h"


using types::record;
using types::overloaded;

namespace trans {

class import : public gc {
  friend class menv;

  record *m;  // Class information of imported module.
  access *location; // Where the dynamic instantiation of the module is.
public:
  import(record *m, access *a)
    : m(m), location(a) {}

  record *getModule()
  {
    return m;
  }

  access *getLocation()
  {
    return location;
  }

  varEntry *getVarEntry()
  {
    varEntry *ent = new varEntry(m, location);
    return ent;
  }
};


// The module environment.
class menv : public sym::table<import *> {
  ty *lookupType(symbol *s, scope_t&);
  import *lookupTypeImport(symbol *s, scope_t&);
  //varEntry *lookupExactVar(symbol *name, signature *sig, scope_t&);
  varEntry *lookupVarByType(symbol *name, ty *t, scope_t&);
  ty *varGetType(symbol *name, scope_t&);

  // This transforms varEntries so that the new varEntry has an access
  // that automatically loads the import record on first.
  static varEntry *importedVarEntry(varEntry *ent, import *i);
public:
  // These methods search the modules, scope by scope, for the requested
  // variable of type.
  ty *lookupType(symbol *s)
  {
    for (scopes_t::iterator p = scopes.begin();
         p != scopes.end();
         ++p)
      if (ty *t = lookupType(s,*p))
        return t;
    return 0;
  }

  // Lookup which import spawns a type.  Needed for record allocation
  // expression done outside a module via importing.
  import *lookupTypeImport(symbol *s)
  {
    for (scopes_t::iterator p = scopes.begin();
         p != scopes.end();
         ++p)
      if (import *i = lookupTypeImport(s,*p))
        return i;
    return 0;
  }
  
#if 0
  varEntry *lookupExactVar(symbol *name, signature *sig)
  {
    for (scopes_t::iterator p = scopes.begin();
         p != scopes.end();
         ++p)
      if (varEntry *v = lookupExactVar(name, sig, *p))
        return v;
    return 0;
  }
#endif
  
  varEntry *lookupVarByType(symbol *name, ty *t)
  {
    for (scopes_t::iterator p = scopes.begin();
         p != scopes.end();
         ++p)
      if (varEntry *v = lookupVarByType(name, t, *p))
        return v;
    return 0;
  }
  
  ty *varGetType(symbol *name)
  {
#if 0 // Yield first match by name.
    for (scopes_t::iterator p = scopes.begin();
         p != scopes.end();
         ++p)
      if (ty *t = varGetType(name,*p))
        return t;
    return 0;
#else // Yield all matches.
    overloaded *o = new overloaded;
    for (scopes_t::iterator p = scopes.begin();
         p != scopes.end();
         ++p)
      if (ty *t = varGetType(name,*p))
        o->addDistinct(t, name->special);
    return o->simplify();
#endif
  }
};

} // namespace trans

#endif //IMPORT_H
