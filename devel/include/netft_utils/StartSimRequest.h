// Generated by gencpp from file netft_utils/StartSimRequest.msg
// DO NOT EDIT!


#ifndef NETFT_UTILS_MESSAGE_STARTSIMREQUEST_H
#define NETFT_UTILS_MESSAGE_STARTSIMREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace netft_utils
{
template <class ContainerAllocator>
struct StartSimRequest_
{
  typedef StartSimRequest_<ContainerAllocator> Type;

  StartSimRequest_()
    : simDim(0)
    , simType(0)
    , simSlope(0.0)
    , maxForce(0.0)  {
    }
  StartSimRequest_(const ContainerAllocator& _alloc)
    : simDim(0)
    , simType(0)
    , simSlope(0.0)
    , maxForce(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _simDim_type;
  _simDim_type simDim;

   typedef int32_t _simType_type;
  _simType_type simType;

   typedef double _simSlope_type;
  _simSlope_type simSlope;

   typedef double _maxForce_type;
  _maxForce_type maxForce;





  typedef boost::shared_ptr< ::netft_utils::StartSimRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::netft_utils::StartSimRequest_<ContainerAllocator> const> ConstPtr;

}; // struct StartSimRequest_

typedef ::netft_utils::StartSimRequest_<std::allocator<void> > StartSimRequest;

typedef boost::shared_ptr< ::netft_utils::StartSimRequest > StartSimRequestPtr;
typedef boost::shared_ptr< ::netft_utils::StartSimRequest const> StartSimRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::netft_utils::StartSimRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::netft_utils::StartSimRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::netft_utils::StartSimRequest_<ContainerAllocator1> & lhs, const ::netft_utils::StartSimRequest_<ContainerAllocator2> & rhs)
{
  return lhs.simDim == rhs.simDim &&
    lhs.simType == rhs.simType &&
    lhs.simSlope == rhs.simSlope &&
    lhs.maxForce == rhs.maxForce;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::netft_utils::StartSimRequest_<ContainerAllocator1> & lhs, const ::netft_utils::StartSimRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace netft_utils

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::netft_utils::StartSimRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::netft_utils::StartSimRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::netft_utils::StartSimRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::netft_utils::StartSimRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::netft_utils::StartSimRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::netft_utils::StartSimRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::netft_utils::StartSimRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f9bc0ea45e890996bb2e2ce115e7c8c3";
  }

  static const char* value(const ::netft_utils::StartSimRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf9bc0ea45e890996ULL;
  static const uint64_t static_value2 = 0xbb2e2ce115e7c8c3ULL;
};

template<class ContainerAllocator>
struct DataType< ::netft_utils::StartSimRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "netft_utils/StartSimRequest";
  }

  static const char* value(const ::netft_utils::StartSimRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::netft_utils::StartSimRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 simDim\n"
"int32 simType\n"
"float64 simSlope\n"
"float64 maxForce\n"
;
  }

  static const char* value(const ::netft_utils::StartSimRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::netft_utils::StartSimRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.simDim);
      stream.next(m.simType);
      stream.next(m.simSlope);
      stream.next(m.maxForce);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StartSimRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::netft_utils::StartSimRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::netft_utils::StartSimRequest_<ContainerAllocator>& v)
  {
    s << indent << "simDim: ";
    Printer<int32_t>::stream(s, indent + "  ", v.simDim);
    s << indent << "simType: ";
    Printer<int32_t>::stream(s, indent + "  ", v.simType);
    s << indent << "simSlope: ";
    Printer<double>::stream(s, indent + "  ", v.simSlope);
    s << indent << "maxForce: ";
    Printer<double>::stream(s, indent + "  ", v.maxForce);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NETFT_UTILS_MESSAGE_STARTSIMREQUEST_H
